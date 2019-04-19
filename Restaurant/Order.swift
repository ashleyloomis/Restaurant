//
//  Order.swift
//  Restaurant
//
//  Created by student7 on 4/9/19.
//  Copyright © 2019 student7. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    } //end init menuItems
} //end struct Order
