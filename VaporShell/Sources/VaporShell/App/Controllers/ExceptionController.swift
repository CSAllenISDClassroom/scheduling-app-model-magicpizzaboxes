import Vapor
import Fluent
import FluentMySQLDriver

public class ExceptionController {

    public func getException_noLevel(_ app:Application) throws {
        app.get("exceptions", "noLevel") {req -> Page<Course> in
            let courseData = try await CourseData.query(on: req.db)
                .filter(\.$level == nil)
                .paginate(for: req)
            let courses = try courseData.map{ try Course(courseData: $0) }

            return courses
        }

        app.get("exceptions", "noCategories") {req -> Page<Course> in
            let courseData = try await CourseData.query(on: req.db)
              .filter(\.$categories == nil)
              .paginate(for: req)
            let courses = try courseData.map{ try Course(courseData: $0) }

            return courses
        }

        app.get("exceptions", "noSubcategories") {req -> Page<Course> in
            let courseData = try await CourseData.query(on: req.db)
              .filter(\.$subcategories == nil)
              .paginate(for: req)
            let courses = try courseData.map{ try Course(courseData: $0) }

            return courses
        }
    }

}
