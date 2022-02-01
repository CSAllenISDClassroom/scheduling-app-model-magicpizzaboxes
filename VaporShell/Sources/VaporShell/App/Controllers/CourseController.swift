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
    public func getCourses(_ app: Application) throws {
        app.get("courses") { req -> Page<Course> in
            var semester : Int? = nil
            var location : String? = nil
            var level : String? = nil
            if let qSemester = try? req.query.get(Int.self, at: "semester") {
                semester = qSemester
            }
            if let qLocation = try? req.query.get(String.self, at: "location") {
                location = qLocation
            }
            if let qLevel = try? req.query.get(String.self, at: "level") {
                level = qLevel
            } 

            var courseData = try await CourseData.query(on: req.db).paginate(for: req)
<<<<<<< HEAD
            var courses = try courseData.map{ try Course(courseData: $0)}
            print(type(of: courseData))
            print(type(of: courses))
            print("yo")
            //filterBySemester(courseData: &courseData, semester: semester)
            //filterByLocation(courseData: &courseData, location: location)
            //filterByLevel(courseData: &courseData, level: level)
            
=======
            let courses = try courseData.map{ try Course(courseData: $0)}
>>>>>>> 658be4c8edfbb27455a4ced33c7011b1d3408c0d
            return courses
        }

         app.get("courses", ":location" ) { req -> Page<Course> in
            guard let location = req.parameters.get("location", as: String.self) else {
                throw Abort (.badRequest)
            }

            let classLocation = try await CourseData.query(on: req.db)
              .filter(\.$location == location)
              .paginate(for: req)
            let courses = try classLocation.map{ try Course(courseData: $0)}
            return courses
             
            }        
    }

/*    private func filterBySemester(courseData: inout Page<CourseData>, semester: Int?) -> Page<CourseData>{
        return semester == nil ? courseData : courseData.filter{$0.semester == semester}
    }

<<<<<<< HEAD
    private func filterByLocation(courseData: inout Page<CourseData>, location: String?) -> Page<CourseData>{
        return location == nil ? courseData : courseData.filter{$0.location == location}
    }
    
    private func filterByLevel(courseData: inout Page<CourseData>, level: String?) -> Page<CourseData>{
        return level == nil ? courseData : courseData.filter{$0.level == level}
    }*/
    
=======
<<<<<<< HEAD
        public func getCourseById(_ app: Application) throws {
=======
    public func getCategories(_ app: Application) throws {
        app.get("categories") { req -> Page<CategoryData> in
            let categoryData = try await CategoryData.query(on: req.db).paginate(for: req)

            return categoryData
        }
    }

    public func getSubcategories(_ app: Application) throws {
        app.get("subcategories") { req -> Page<SubcategoryData> in
            let subcategoryData = try await SubcategoryData.query(on: req.db).paginate(for: req)

            return subcategoryData
        }
    }

>>>>>>> 658be4c8edfbb27455a4ced33c7011b1d3408c0d
    public func getCourseById(_ app: Application) throws {
>>>>>>> 57eefd9a15ab2f7effb3035086d5c4df7697dde3
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

    public func getCoursesBySubject(_ app: Application) throws {
        app.get("courses", "subject", ":subject") { req -> Page<Course> in
            let mathKeys = ["math", "algebra", "math", "geometry", "calc"]
            let scienceKeys = ["science", "chem", "bio", "physic"]
            let englishKeys = ["english", "literature"]
            let socialStudiesKeys = ["history", "gov", "econ", "geograph"]
            let subject : Subject
            guard let inputSubject = req.parameters.get("subject") else {
                throw Abort(.badRequest)
            }
            switch inputSubject {
                case "math": subject = Subject.math
                case "science": subject = Subject.science
                case "socialStudies": subject = Subject.socialStudies
                case "english": subject = Subject.english
                default: throw Abort(.badRequest)
            }
            let keys : [String]
            switch subject {
                case Subject.math: keys = mathKeys
                case Subject.science: keys = scienceKeys
                case Subject.socialStudies: keys = socialStudiesKeys
                case Subject.english: keys = englishKeys
            }
            let courseData = try await CourseData.query(on: req.db).group(.or) { group in
                for key in keys {
                    group.filter(\.$description ~~ key)
                }
            }.paginate(for: req)
            let courses = try courseData.map{ try Course(courseData: $0)}

            return courses
        }
    }    
}
