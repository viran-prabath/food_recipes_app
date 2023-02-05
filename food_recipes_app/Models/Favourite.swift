//
//  Favourite.swift
//  food_recipes_app
//
//  Created by MacOs12 on 2023-02-04.
//  Copyright © 2023 VPJ Production. All rights reserved.
//

import Foundation

struct FavoriteDataModels: Codable {
    let userId: String?
    let foodId: String?
    let createdDateTime: String
    
    enum CodingKeys: String, CodingKey,Codable {
        case userId
        case foodId
        case createdDateTime
    }
}
