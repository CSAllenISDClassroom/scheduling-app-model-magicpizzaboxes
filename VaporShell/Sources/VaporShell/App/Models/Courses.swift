import Vapor
import Fluent

final class Course: Codable {

    public var id: String?
    public var description: String?
    public var shortDescription: String?
    public var longDescription: String?
    public var semester: Int
    public var locationName: String?
    public var lowCredit: Double?
    public var highCredit: Double?
    public var lowGrade: Int?
    public var highGrade: Int?
    public var application: Int?
    public var courseLevel: String?
    public var applicationCode: String?
    public var periodsAvailable: [[Int]]

    public init(courseData: CourseData) throws {
        self.id = courseData.id
        self.description = courseData.description
        self.shortDescription = courseData.shortDescription
        self.longDescription = courseData.longDescription
        self.semester = try Self.semesterAsInteger(semester: courseData.semester)
        self.locationName = courseData.locationName
        self.lowCredit = courseData.lowCredit
        self.highCredit = courseData.highCredit
        self.lowGrade = courseData.lowGrade
        self.highGrade = courseData.highGrade
        self.application = courseData.application
        self.courseLevel = Course.getCourseLevel(courseData: courseData)
        self.applicationCode = courseData.applicationCode
        self.periodsAvailable = Course.getPeriodsFromBitMap(bitMap: courseData.availabilityBitmap)
    }

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
    
    private static func getPeriodsFromBitMap(bitMap: UInt?) -> [[Int]] {
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

    private static func getCourseLevel(courseData: CourseData) -> String? {        
        if courseData.onLevel == 1 {
            return "isOnLevel"
        } else if courseData.preAP == 1 {
            return "isPreAP"
        } else if courseData.dualCredit == 1 {
            return "isDualCredit"
        } else if courseData.AP == 1 {
            return "isAP"
        } else if courseData.IB == 1 {
            return "isIB"
        }

        return nil
    }
    
    

}    
