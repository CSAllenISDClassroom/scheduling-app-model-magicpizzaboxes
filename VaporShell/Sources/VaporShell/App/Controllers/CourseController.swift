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
            let courseData = try await CourseData.query(on: req.db).paginate(for: req)
            if let description = try? req.query.get(String.self, at: "description") {
                 
                 return courses.filter(\.$description ~~ description) 
            }else {
                return try courseData.map{ try Course(courseData: $0)}
           
            }
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

    
} 
