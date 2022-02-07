import Vapor
import Fluent
import FluentMySQLDriver

public class SubcategoryController{

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

    public func getSubcategories(_ app: Application) throws {
        app.get("subcategories") { req -> Page<Subcategory> in
            let subcategoryData = try await SubcategoryData.query(on: req.db).paginate(for: req)
            let subcategories = try subcategoryData.map{ try Subcategory(subcategoryData: $0)}

            return subcategories
        }
    }            
} 
