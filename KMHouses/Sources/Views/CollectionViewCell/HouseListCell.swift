//
//  HouseListCell.swift
//  HouseListCell is the subclass of UICollectionViewCell for displaying the house data in the collection view.
//
//  Created by Pankaj Rathor on 15/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HouseListCell: UICollectionViewCell {
    
    // Cell identifier
    static let cellIdentifier = "HouseListCellIdentifier"
    
    @IBOutlet private weak var houseImageView: UIImageView!
    @IBOutlet private weak var number: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    // Method to set the UI elements with House details
    func setHouseData(house: House)  {
        
        let imageViewLayer = self.houseImageView.layer
        
        imageViewLayer.borderColor = UIColor.grayColor().CGColor
        imageViewLayer.borderWidth = 1
        
        let imageName = String(format: "table-%02d.png", house.number)
        self.houseImageView.image = UIImage(named: imageName)
        
        self.number.text = String(format: "%02d", house.number)
        
        let name = house.name
        
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
    }
    
    // Overriding the method to clean the cell for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        houseImageView.image = nil
        number.text = nil
        nameLabel.text = nil
        addressLabel.text = nil
    }
}
