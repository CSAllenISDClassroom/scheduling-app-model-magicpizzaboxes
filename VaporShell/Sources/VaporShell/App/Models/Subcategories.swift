import Vapor
import Fluent

final class Subcategory: Codable {
    
    //establish variables to their type
    public var id: String?
    public var categoryId: Int?
    public var name: String?

    //assign the variables to be connected to course data and initialized.
    public init(subcategoryData: SubcategoryData) throws {
        self.id = subcategoryData.id
        self.categoryId = subcategoryData.categoryId
        self.name = subcategoryData.name        
    }    
} 

