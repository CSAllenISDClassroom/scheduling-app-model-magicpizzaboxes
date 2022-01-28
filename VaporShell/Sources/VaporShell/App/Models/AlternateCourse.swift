import Vapor
import Fluent

class Course: Content {

    public var id: String?
    public var description: String    
    public var shortDescription: String
    public var longDescription: String?
    public var semester: Int
    public var locationName: String    
    public var creditsLow: Double?
    public var creditsHigh: Double?
    public var gradesLow: Int?
    public var gradesHigh: Int?
    public var isApplication: Bool
    public var courseLevel: String?
    public var applicationCode: String?
    // public var periodsAvailable: [[Int]]

    private static func semesterAsInteger(semester: String) -> Int {
        guard semester.count == 2,
              semester.first == "S" else {
            throw Abort(.badRequest, reason: "Invalid semester input, S must be first character.")
        }

        guard let semesterInteger = Int(String(semester.last!)) else {
            throw Abort(.badRequest, reason: "Invalid semester input, second char must be int.")
        }

        return semesterInteger
    }

    private static func availabilityPeriods(bitmap: Int) -> [[Int]] {
        // Begin with an empty array
        var periods = [[Int]]()

        // Handle all single-period cases (bits 0 ... 10)
        for bit in 0 ... 10 {
            if bitmap & (1 << bit) != 0 {
                let period = bit
                periods.append([period])
            }
        }

        // Handle all vertical, double-blocked periods (bits 11 ... 20)
        // These bits map to period pairs, e.g. 0/1, 1/2, 2/3, etc.
        for bit in 11 ... 20 {
            if bitmap & (1 << bit) != 0 {
                let firstPeriod = bit - 11
                let secondPeriod = firstPeriod + 1
                periods.append([firstPeriod, secondPeriod])
            }
        }

        // Handle all horizontal, double-blocked periods (bits 21 ... 23)
        // These bits map to period pairs, e.g. 2/5, 3/6, 4/7
        for bit in 21 ... 23 {
            if bitmap & (1 << bit) != 0 {
                let firstPeriod = bit - 19
                let secondPeriod = firstPeriod + 3
                periods.append([firstPeriod, secondPeriod])
            }
        }
        
        return periods
    }
}
