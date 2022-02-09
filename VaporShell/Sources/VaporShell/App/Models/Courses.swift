import Vapor
import Fluent


final class Course: Codable {
    
    //establish variables to their type
    public var id: String?
    public var semesterLength: String?
    public var semester: Int?
    public var description: String?
    public var dualCreditSchedule: String?
    public var location: String?
    public var periodsAvailable: [[Int]]
    public var level: String?
    public var categories: String?
    public var subcategories: String?

    //assign the variables to be connected to course data and initialized.
    public init(courseData: CourseData) throws {
        self.id = courseData.id
        self.semesterLength = courseData.semesterLength
        self.semester = courseData.semester
        self.description = courseData.description
        self.dualCreditSchedule = courseData.dualCreditSchedule
        self.location = courseData.location        
        self.periodsAvailable = Course.getPeriodsFromBitMap(bitMap: courseData.periodsAvailable)
        self.level = courseData.level
        self.categories = courseData.categories
        self.subcategories = courseData.subcategories

        //Course.getPeriodsFromBitMap(bitMap: courseData.availabilityBitmap)
    }

    //check if there are two characters in the semester
    // then check if there is an S in front.
    // If so, remove the S and turn the number into an Int
    private static func semesterAsInteger(semester: String) throws -> Int{
        guard semester.count == 2,
              semester.first == "S" else {
            throw Abort(.badRequest, reason: "Invalid Semester input, S must be the first character.")
        }

        guard let semesterInteger = Int(String(semester.last!)),
              (1 ... 2).contains(semesterInteger) else {
            throw Abort(.badRequest, reason: "Invalid semester input, second char must be Int")
        }

        return semesterInteger
    }

    // Bit 0-9 related directly to period
    // Subtract from 11 and 10 in order to account for Double Block Vertical
    // Bit 21-23 directly correlates to Double-Block Horizontal 
    private static func bitToPeriods(bit: Int) -> [Int] {
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
    public static func getPeriodsFromBitMap(bitMap: Int?) -> [[Int]] {
        guard let startingBitMap = bitMap else {
            return []
        }
        
        var currentBitMap = Int(startingBitMap)
        var periods = [[Int]]()
        
        //Find largest bit possible, then work down
        //Takes Log2 of currentBitMap then converts it to int to find bit 
        
        while (currentBitMap > 0) {
            let bit = Int(log2(Double(currentBitMap)))
            currentBitMap -= Int(pow(Double(2), Double(bit)))
            periods.insert(bitToPeriods(bit: bit), at: 0)
        }

        return periods
    }

    // private static func getCourseLevel(courseData: CourseData) -> String? {
    //     // Checking the class level
    //     // Check if the course is on level by checking if its status number is 1, if it is not, repeat with the next level
    //     // return nil if there are no course level available
    //     if courseData.onLevel == 1 {
    //         return "On Level"
    //     } else if courseData.preAP == 1 {
    //         return "Advanced"
    //     } else if courseData.dualCredit == 1 {
    //         return "Dual Credit"
    //     } else if courseData.AP == 1 {
    //         return "AP"
    //     } else if courseData.IB == 1 {
    //         return "IB"
    //     }

    //     return nil
    // }
}
