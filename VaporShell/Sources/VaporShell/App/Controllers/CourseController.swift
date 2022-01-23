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

    private func bitToPeriods(bit: Int) -> [Int] {
        if (bit < 11) {return [bit]}

        switch (bit) {
        case 11:
            return [0, 1]
        case 12:
            return [1, 2]
        case 13:
            return [2, 3]
        case 14:
            return [3, 4]
        case 15:
            return [4, 5]
        case 16:
            return [5, 6]
        case 17:
            return [6, 7]
        case 18:
            return [7, 8]
        case 19:
            return [8, 9]
        case 20:
            return [9, 10]
        case 21:
            return [2, 5]
        case 22:
            return [3, 6]
        case 23:
            return [4, 7]
        default:
            return [Int]()
        }
    }
    
    private func getCoursesFromBitMap(bitMap: Int) -> [[Int]] {
        var currentBitMap = bitMap
        var periods = [[Int]]()

        while (currentBitMap > 0) {
            let bit = Int(log2(Double(currentBitMap)))
            currentBitMap -= Int(pow(Double(2), Double(bit)))
            periods.append(bitToPeriods(bit: bit))
        }

        return periods
    }

    public func getCourses(_ app: Application) throws {
        app.get("courses") { req -> Page<Course> in
            let courseData = try await CourseData.query(on: req.db)
              .paginate(for: req)
            let courses = try courseData.map{ try Course(courseData: $0) }
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
