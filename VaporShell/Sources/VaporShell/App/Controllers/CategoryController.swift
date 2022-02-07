import Vapor
import Fluent
import FluentMySQLDriver

public class CategoryController{

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

    public func getCategories(_ app: Application) throws {
        app.get("categories") { req -> Page<Category> in
            let categoryData = try await CategoryData.query(on: req.db).paginate(for: req)
            let categories = try categoryData.map{ try Category(categoryData: $0)}

            return categories
        }
    }            
} 
