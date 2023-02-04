//
//  User.swift
//  food_recipes_app
//
//  Created by VPJ MacOs on 03/02/2023.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import Foundation

struct UserDataModels: Codable {
    let userId: String?
    let first_name: String?
    let last_name: String?
    let email: String?
    let password: String?
    let isActive: Bool
    let createdDateTime: String
    
    enum CodingKeys: String, CodingKey,Codable {
        case userId
        case first_name
        case last_name
        case email
        case password
        case isActive
        case createdDateTime
    }
}
