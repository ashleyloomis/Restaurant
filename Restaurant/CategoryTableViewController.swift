//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by student7 on 4/9/19.
//  Copyright © 2019 student7. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    //let menuController = MenuController()
    var categories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        MenuController.shared.fetchCategories{(categories) in
            if let categories = categories {
                self.updateUI(with: categories)
            }
        } //end menuController.fetchCategories
        
    } //end viewDidLoad()
    
    func updateUI(with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        } //end DispatchQueue
    } //end func updateUI

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    } //end numberOfRowsInSection


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    } //end cellForRowAt

    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let categoryString = categories[indexPath.row]
        cell.textLabel?.text = categoryString.capitalized
    } //end forItemAt

  

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuSegue" {
            let menuTableViewController = segue.destination as! MenuTableViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuTableViewController.category = categories[index]
        } //end if segue.identifier == "MenuSegue
    } //end prepare for segue


} //end class CategoryTableViewController
