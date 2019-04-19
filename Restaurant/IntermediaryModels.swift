//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by student7 on 4/9/19.
//  Copyright © 2019 student7. All rights reserved.
//

import Foundation


struct Categories: Codable {
    let categories: [String]
} //end struct Categories

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    } //end enum CodingKeys
} //end struct PreparationTime
