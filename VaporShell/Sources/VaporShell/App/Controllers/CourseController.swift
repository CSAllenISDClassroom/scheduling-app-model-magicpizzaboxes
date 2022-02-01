import Vapor
import Fluent
import FluentMySQLDriver

public class CourseController{

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

    public func getCourses(_ app: Application) throws {
        app.get("courses") { req -> Page<Course> in
            guard let periods = req.query[Bool.self, at: "period"] else {
                throw Abort(.badRequest)
            }
            print(periods)
            let courseData = try await CourseData.query(on: req.db).paginate(for: req)
            let courses = try courseData.map{ try Course(courseData: $0)}

            return courses
        }
    }
    
    public func getCourseById(_ app: Application) throws {
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
