//
//  HouseGridCell.swift
//  KMHouses
//
//  Created by Pankaj Rathor on 15/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HouseGridCell: UICollectionViewCell {
    
    static let cellIdentifier = "HouseGrillCellIdentifier"

    @IBOutlet private weak var houseImageView: UIImageView!
    
    func setHouseData(house: House)  {
        
        let imageViewLayer = self.houseImageView.layer
        
        imageViewLayer.borderColor = UIColor.grayColor().CGColor
        imageViewLayer.borderWidth = 1
        
        let imageName = String(format: "table-%02d.png", house.number)
        self.houseImageView.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        houseImageView.image = nil
    }
}
