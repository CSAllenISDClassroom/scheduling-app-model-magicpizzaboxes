import Vapor
import Fluent
import FluentMySQLDriver

public class CourseController {

    /// Retrieves the employee record specified by the ID
    ///
    /// * API Endpoint: /employees/{id}
    /// Method: GET
    /// * Query parameters: None
    /// * Status codes:
    ///   * 200 Successful
    ///   * 400 Bad Request
    ///   * 404 Not Found
    ///
    /// Returns ``Employee``

    //converts string to array of Ints
    private func stringToIntArray (_ string: String) -> [[Int]] {
        let stringArr = string.split(separator: ",")
        var finalArray = [[Int]]()

        for string in stringArr {
            let splitString = string.split(separator: "-")
            
            
            finalArray.append(splitString.map{Int($0)!})
        }
        
        return finalArray
    }


    private func isSubset (_ parentArray: [[Int]], _ childArray: [[Int]]) -> Bool {
        let parentSet = Set(parentArray)
        let childSet = Set(childArray)

        return childSet.isSubset(of: parentSet)
    }
    
  
    //query for getting parameters of classes individually.
    public func getCourses(_ app: Application) throws {
        app.get("courses") { req -> Page<Course> in

            //try?: returns nil if not of same type.
            //.self: chekcs if same type.
            let semester = try? req.query.get(Int.self, at: "semester")
            let location = try? req.query.get(String.self, at: "location")
            let level = try? req.query.get(String.self, at: "level")
            let periods = try? req.query.get(String.self, at: "periods")

            //if input filter is nil, then show all course.
            // \.$semester is a keypath: if there is an input, then filter by input
            let courseData = CourseData.query(on: req.db)
              .filter(semester == nil ? \.$id != "" : \.$semester == semester!)
              .filter(location == nil ? \.$id != "" : \.$location == location!)
              .filter(level == nil ? \.$id != "" : \.$level == level!)
              
            //map applies filter to all courseData
            let courses = try await courseData.all().map{ try Course(courseData: $0)}
            
            let finalCourseIDs = courses.filter{
                if (periods == nil) {return true}
                
                return self.isSubset($0.periodsAvailable, self.stringToIntArray(periods!))//self.stringToIntArray(periods!), $0.periodsAvailable)
            }.map{$0.id!}
            
            return try await courseData.filter(\.$id ~~ finalCourseIDs).paginate(for: req).map{try Course(courseData: $0)}
        }
    }

    public func getCategories(_ app: Application) throws {
        app.get("categories") { req -> Page<CategoryData> in
            let categoryData = try await CategoryData.query(on: req.db).paginate(for: req)

            return categoryData
        }
    }
    
    public func getSubcategories(_ app: Application) throws {
        app.get("subcategories") { req -> Page<SubcategoryData> in
            let subcategoryData = try await SubcategoryData.query(on: req.db).paginate(for: req)

            return subcategoryData
        }
    }
    
    public func getCourseById(_ app: Application) throws {
        // app.get("courses", ":id") { req -> CourseData in
        //     guard let id = req.parameters.get("id", as: String.self) else {
        //         throw Abort(.badRequest)
        //     }
        //     guard let schedClass = try await CourseData.query(on: req.db)
        //             .filter(\.$id == id)
        //             .first() else {
        //         throw Abort(.notFound)
        //     }
        // }


        app.get("courses", ":id") { req -> CourseData in
            guard let id = req.parameters.get("id", as: String.self) else {
                throw Abort(.badRequest)
            }
            
            guard let schedClass = try await CourseData.query(on: req.db)
                    .filter(\.$id == id)
                    .first() else {
                throw Abort(.notFound)
            }

            return schedClass
        }
        
    }    

    public func getCoursesBySubject(_ app: Application) throws {
        app.get("courses", "subject", ":subject") { req -> Page<Course> in
            let mathKeys = ["math", "algebra", "math", "geometry", "calc"]
            let scienceKeys = ["science", "chem", "bio", "physic"]
            let englishKeys = ["english", "literature"]
            let socialStudiesKeys = ["history", "gov", "econ", "geograph"]
            let subject : Subject
            guard let inputSubject = req.parameters.get("subject") else {
                throw Abort(.badRequest)
            }
            switch inputSubject {
            case "math": subject = Subject.math
            case "science": subject = Subject.science
            case "socialStudies": subject = Subject.socialStudies
            case "english": subject = Subject.english
            default: throw Abort(.badRequest)
            }
            let keys : [String]
            switch subject {
            case Subject.math: keys = mathKeys
            case Subject.science: keys = scienceKeys
            case Subject.socialStudies: keys = socialStudiesKeys
            case Subject.english: keys = englishKeys
            }
            let courseData = try await CourseData.query(on: req.db).group(.or) { group in
                for key in keys {
                    group.filter(\.$description ~~ key)
                }
            }.paginate(for: req)
            let courses = try courseData.map{ try Course(courseData: $0)}

            return courses
        }
    }    
}
