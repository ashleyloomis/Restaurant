//
//  MenuController.swift
//  Restaurant
//
//  Created by student7 on 4/9/19.
//  Copyright © 2019 student7. All rights reserved.
//

import Foundation
import UIKit

class MenuController {
    static let shared = MenuController()
    static let orderUpdatedNotification = Notification.Name("MenuController.orderUpdated")
    let baseURL = URL(string: "http://localhost:8090/")!
    
    var order = Order() {
        didSet {
            NotificationCenter.default.post(name: MenuController.orderUpdatedNotification, object: nil)
        } //end didSet
    } //end order
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        let categoryURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryURL) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let categories = try? jsonDecoder.decode(Categories.self, from: data) {
                completion(categories.categories)
            } else {
                completion(nil)
            }
        } //end let task = URLSession
        task.resume()
    } //end func fetchCategories
    
    func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        let task = URLSession.shared.dataTask(with: menuURL) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data) {
                completion(menuItems.items)
            } else {
                completion(nil)
            }
        } //end let task = URLSession
        task.resume()
    } //end func fetchMenuItems
    
    func submitOrder(forMenuIDs menuIDs: [Int], completion: @escaping (Int?) -> Void) {
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data: [String: [Int]] = ["menuIds": menuIDs]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data) {
                completion(preparationTime.prepTime)
            } else {
                completion(nil)
            }
        } //end let task = URLSession
        task.resume()
    } //end func submitOrder
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        } //end let task = 
        task.resume()
    } //end func fetchImage
    
} //end class MenuController
