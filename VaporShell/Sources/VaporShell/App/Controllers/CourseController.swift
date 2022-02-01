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
            let courses = try courseData.map{ try Course(courseData: $0)}

            return courses
        }
    }

    public func getCategories(_ app: Application) throws {
        app.get("categories") { req -> Page<Category> in
            let categoryData = try await CategoryData.query(on: req.db).paginate(for: req)
            let categories = try categoryData.map{ try Category(categoryData: $0)}

            return categories
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
