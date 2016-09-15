//
//  HouseDetailsViewController.swift
//  HouseDetailsViewController class to display the House details along with bigger image.
//
//  Created by Pankaj Rathor on 14/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HouseDetailsViewController: UIViewController {
    
    // IBOutlets are made private to avoid external access
    @IBOutlet private weak var houseImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    
    // Index of the item that needs to be displayed
    var houseIndex: Int = 0
    
    // Overriding viewWillAppear to setup the UI elements.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setupHouseDetails()
    }
    
    // Setting up the UI elements using the House object details
    func setupHouseDetails() {
        
        let house = HouseDataManager.sharedManager[self.houseIndex]
        
        let name = house.name
        
        // If name of the house is missing, display the locality/area of the address filed in nameLabel and city in addressLabel
        if name == "" {
            
            let address = house.address
            
            if let addressComponents = address?.componentsSeparatedByString(",") {
                
                if (addressComponents.count > 1) {
                    self.nameLabel.text = addressComponents[0]
                    self.addressLabel.text = addressComponents[1]
                }
                else {
                    self.nameLabel.text = addressComponents[0]
                    self.addressLabel.text = addressComponents[0]
                }
            }
        }
        else {
            
            self.nameLabel.text = name
            self.addressLabel.text = house.address
        }
        
        let imageName = String(format: "miniature%d.png", house.number)
        self.houseImageView.image = UIImage(named: imageName)
        
        self.numberLabel.text = String(format: "%02d", house.number)
    }
}
