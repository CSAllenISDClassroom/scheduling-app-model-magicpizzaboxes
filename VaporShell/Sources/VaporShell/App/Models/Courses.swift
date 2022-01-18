/*
VaporShell provides a minimal framework for starting Vapor projects.
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
import Fluent
import FluentMySQLDriver

// UNCOMMENT-DATABASE to configure database example
// // Content conformance will ensure that the object can be encoded and decoded from HTTP messages.
final class Class: Model, Content {
    // Name of the table or collection.
    static let schema = "CourseSectionsView"

    // Unique identifier for this Employee.
    @ID(custom: "code", generatedBy: .database)
    var id: String?

    // Additional fields for this Employee.
    @Field(key: "description")
    var description: String?

    @Field(key: "shortDescription")
    var shortDescription: String? 

    @Field(key: "longDescription")
    var longDescription: String?

    @Field(key: "semester")
    var semester: String?

    @Field(key: "locationName")
    var locationName: String?

    @Field(key: "creditsLow")
    var lowCredit: Double?

    @Field(key: "creditsHigh")
    var highCredit: Double?

    @Field(key: "gradesLow")
    var lowGrade: Int?

    @Field(key: "gradesHigh")
    var highGrade: Int?

    @Field(key: "isApplication")
    var application: Int?

    @Field(key: "isOnLevel")
    var onLevel: Int

    @Field(key: "isPreAP")
    var preAP: Int

    @Field(key: "isAP")
    var AP: Int
    
    @Field(key: "isIB")
    var IB: Int
    
    @Field(key: "isDualCredit")
    var dualCredit: Int

    @Field(key: "applicationCode")
    var applicationCode: String?

    @Field(key: "availabilityBitmap")
    var availabilityBitmap: UInt?

    // Creates a new, empty Employee.
    init() { }
}

