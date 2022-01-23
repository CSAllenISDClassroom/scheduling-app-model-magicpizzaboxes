import Vapor
import Fluent

final class Course: Codable {

    // public var id: String?
    // public var description: String?
    // public var shortDescription: String?
    // public var longDescription: String?
    // public var semester: String?
    // public var locationName: String
    // public var lowCredit: Double?
    // public var highCredit: Double?
    // public var lowGrade: Int?
    // public var highGrade: Int?
    // public var application: Int?
    // public var courseLevel: Int
    // public var applicationCode: String?
    //public var periodsAvailable: [[Int]]

    private static func semesterAsInteger(semester: String) throws -> Int{
        guard semester.count == 2,
              semester.first == "S" else {
            throw Abort(.badRequest, reason: "Invalid Semester input, S must be the first character.")
        }

        guard let semesterInteger = Int(String(semester.last!)) else {
            throw Abort(.badRequest, reason: "Invalid semester input, second char must be Int")
        }

        return semesterInteger
    }

    private static func availabilityPeriods(bitmap: Int) -> [[Int]]{
        //Begin with an empty array
        var periods = [[Int]]()

        //Handle all single-periods cases (bits 0 ... 10)

        for bit in (0 ... 10){

            //& is applying a mask
            // (1 << bit) is the mask
            if bitmap & (1 << bit) != 0 {
                let period = bit
                periods.append([period])
            }            
        }

        //Handle all vertical, double-blocked periods (bits 11 ... 20)
        //These bits map to period pairs, ex (0/1, 1/2, 2/3. etc.)

        for bit in 11 ... 20{
            if bitmap & (1 << bit) != 0{
                let firstPeriod = bit - 11
                let secondPeriod = firstPeriod + 1
                periods.append([firstPeriod, secondPeriod])
            }
        }

        //Handle all horizontal, double-blocked periods (bits 21 ... 23)
        //These bits map to period pairs, ex (2/5, 3/6, 4/7)

        for bit in 21 ... 23{
            if bitmap & (1 << bit) != 0{
                let firstPeriod = bit - 19
                let secondPeriod = firstPeriod + 3
                periods.append([firstPeriod, secondPeriod])
            }
        }

        return periods
    }

    public init(courseData:CourseData){
        // func getCourseLevel(courseData: CourseData) -> String? {
        //     if(courseData.isOnLevel) {
        //         return "isOnLevel"
        //     } else if(courseData.isPreAP) {
        //         return "isPreAP"
        //     } else if(courseData.isDualCredit) {
        //         return "isDualCredit"
        //     } else if(courseData.isAP) {
        //         return "isAP"
        //     } else if(courseData.isIB) {
        //         return "isIB"
        //     } else {
        //         return nil
        //     }
        // }
    

    func sRemover(courseData: CourseData) -> Int {
        return courseData.semester == "S1" ? 1 : 2
    }

    // self.id = CourseData.id
    // self.description = CourseData.description
    // self.shortDescription = CourseData.shortDescription
    // self.longDescription = CourseData.longDescription
    // self.semester = sRemover(CourseData:CourseData)
    // //CourseData.semester // do magic to remove the S TODO
    // self.locationName = CourseData.locationName
    // self.creditsLow = CourseData.creditsLow
    // self.creditsHigh = CourseData.creditsHigh
    // self.gradesLow = CourseData.gradesLow
    // self.gradesHigh = CourseData.gradesHigh
    // self.isApplication = CourseData.isApplication
    // self.courseLevel = getCourseLevel(CourseData: CourseData)
    // self.applicationCode = CourseData.applicationCode
    
    }
}    
