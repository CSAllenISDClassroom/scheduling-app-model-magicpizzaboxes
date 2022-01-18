import Vapor
import Fluent
import FluentMySQLDriver

public class ClassController{

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

    
    public func getClassesById(_ app: Application) throws {
        app.get("classes", "id") { req -> Class in
        guard let id = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let schedClass = try await Class.query(on: req.db)
                .filter(\.$id == id)
                .first() else {
            throw Abort(.notFound)
        }

        return schedClass
        }
    }
} 
