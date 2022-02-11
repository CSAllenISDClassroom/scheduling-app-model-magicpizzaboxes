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
    private func stringToIntArray (_ string: String) -> [Int] {
        let stringArr = string.split(separator: ",")
        return stringArr.map{Int($0)!}
    }

    
    private func periodsToBit (_ periods: String) -> Int {
        let arr = stringToIntArray(periods)
        //if array has 1 index, then there is 1 decimal place -> return arr[0] for period.
        //ie. if arr[0] = 5, then period = fifth
        if (arr.count == 1) {return arr[0]}

        //double blocked classes
        if (arr.count == 2 && arr[0] + 11 <= 20 && arr[1] + 10 <= 20) {return arr[0] + 11}

        //special cases of double blocked classes that are not next to each other.
        switch (arr) {
        case [2, 5]:
            return 21
        case [3, 6]:
            return 22
        case [4, 7]:
            return 23
        default:
            return Int()
        }
    }

    //turns bitmap from database into an integer.
    public func getBitMapFromPeriods(_ periods: String) -> Int {
        let bit = periodsToBit(periods)
        return Int(pow(Double(2), Double(bit)))
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
            let courseData = try await CourseData.query(on: req.db)
              .filter(semester == nil ? \.$id != "" : \.$semester == semester!)
              .filter(location == nil ? \.$id != "" : \.$location == location!)
              .filter(level == nil ? \.$id != "" : \.$level == level!)
              .paginate(for: req)
            //map applies filter to all courseData
            let courses = try courseData.map{ try Course(courseData: $0)}
            
            return courses
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
