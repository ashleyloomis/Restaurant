//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by student7 on 4/9/19.
//  Copyright © 2019 student7. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    var menuItem: MenuItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        addToOrderButton.layer.cornerRadius = 5.0
        updateUI()
    } //end viewDidLoad()
   
    func updateUI () {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            } //end DispatchQueue
        } //end MenuController.shared.fetchImage
    } //end func updateUI

    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } //end UIView.animate
        
        MenuController.shared.order.menuItems.append(menuItem)
    } //end action orderButtonTapped
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //end class MenuItemDetailViewController
