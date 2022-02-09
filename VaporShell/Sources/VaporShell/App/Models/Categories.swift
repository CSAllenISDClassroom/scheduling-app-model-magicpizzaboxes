import Vapor
import Fluent

final class Category: Codable {
    
    //establish variables to their type
    public var id: String?
    public var name: String?

    //assign the variables to be connected to course data and initialized.
    public init(categoryData: CategoryData) throws {
        self.id = categoryData.id
        self.name = categoryData.name
    }    
} 

