//
//  MenuItem.swift
//  Restaurant
//
//  Created by student7 on 4/9/19.
//  Copyright © 2019 student7. All rights reserved.
//

import Foundation


struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    } //end enum CodingKeys
    
} //end struct MenuItem

struct MenuItems: Codable {
    let items: [MenuItem]
} //end struct MenuItems


