//
//  EmployeeDetail.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 05/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import Foundation

struct EmployeeDetail: Decodable {
    
    let employeeId: String
    let firstName: String
    let lastName: String
    let createdAt: String
    let avatar: String
    let email: String
    let jobTitle: String
    let latitude: String
    let longitude: String
    let phone: String
    let favouriteColor: String
    
    private enum CodingKeys : String, CodingKey {
        case employeeId = "id",
        firstName,
        lastName,
        createdAt,
        avatar,
        email,
        jobTitle,
        latitude,
        longitude,
        phone,
        favouriteColor
    }
}
