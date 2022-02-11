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


    private func isSubset (_ parentArray: [Int], _ childArray: [Int]) -> Bool {
        let parentSet = Set(parentArray)
        let childSet = Set(childArray)

        return childSet.isSubset(of: parentSet)
    }
    
    private func getPotentialBits (_ periods: String) -> [Int] {
        let periodsArr = stringToIntArray(periods)
        var potentialBits = [Int]()
        
        if (periodsArr.count == 1) {
            potentialBits.append(periodsArr[0])
        }

        for x in 0..<10 {
            let currentBlockArray = [x, x + 1]
            
            if (isSubset(currentBlockArray, periodsArr)) {potentialBits.append(x + 11)}
        }

        for x in 0..<3 {
            let currentBlockArray = [x + 2, x + 5]

            if (isSubset(currentBlockArray, periodsArr)) {potentialBits.append(x + 11)}
        }
        
        return potentialBits
    }

    public func getPotentialBitMapFromPeriods(_ periods: String) -> [Int] {
        let potentialBits = getPotentialBits(periods)
        return potentialBits.map{Int(pow(Double(2), Double($0)))}
    }
    
    public func getCourses(_ app: Application) throws {
        app.get("courses") { req -> Page<Course> in
            
            let semester = try? req.query.get(Int.self, at: "semester")
            let location = try? req.query.get(String.self, at: "location")
            let level = try? req.query.get(String.self, at: "level")
            let periods = try? req.query.get(String.self, at: "periods")
            
            let courseData = try await CourseData.query(on: req.db)
              .filter(semester == nil ? \.$id != "" : \.$semester == semester!)
              .filter(location == nil ? \.$id != "" : \.$location == location!)
              .filter(level == nil ? \.$id != "" : \.$level == level!)
              .filter(periods == nil ? \.$id != "" : \.$periodsAvailable ~~ self.getPotentialBitMapFromPeriods(periods!))
              .paginate(for: req)
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
