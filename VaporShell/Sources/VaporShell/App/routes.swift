/*
 VaporShell provides a minimal framework for starting Igis projects.
 Copyright (C) 2021, 2022 CoderMerlin.com
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import Vapor

// UNCOMMENT-DATABASE to configure database example
import Fluent
import FluentMySQLDriver

let courseController = CourseController()
let categoryController = CategoryController()
let subcategoryController = SubcategoryController()
let exceptionController = ExceptionController()

func routes(_ app: Application) throws {

    
    
    app.get { req in
        return "It works!"
    }
    
    // UNCOMMENT-DATABASE to configure database example
    // // Find an employee with the specified ID
    try courseController.getCourseById(app)
    try courseController.getCourses(app)
    try categoryController.getCategories(app)
    try subcategoryController.getSubcategories(app)
    try exceptionController.getException(app)    
    // List all employees using paging
// List all employees using paging
    /*    app.get("courses") { req -> Page<CourseData>  in
          let courses = try await CourseData.query(on: req.db)
          .paginate(for: req)
          return courses
          }*/
}
