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
        if (bit <= 10) {return [bit]}

        if (bit <= 20) {return [bit - 11, bit - 10]}
        
        switch (bit) {
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

        //Find largest bit possible, then work down
        //Takes Log2 of currentBitMap then converts it to int to find bit 
        
        while (currentBitMap > 0) {
            let bit = Int(log2(Double(currentBitMap)))
            currentBitMap -= Int(pow(Double(2), Double(bit)))
            periods.append(bitToPeriods(bit: bit))
        }

        return periods
    }
    
    public func getCourseById(_ app: Application) throws {
        app.get("courses", ":id") { req -> Course in
        guard let id = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let schedClass = try await Course.query(on: req.db)
                .filter(\.$id == id)
                .first() else {
            throw Abort(.notFound)
        }

        return schedClass
        }
    }

    public func getCourses(_ app: Application) throws {
        app.get("courses") {req -> Page<Course> in
            let courseData = try await CourseData.query(on: req.db).paginate(for: req)
            let courses = coursesData.map{Course(courseData: $0)}

            return courses
        }
    }
} 
