//
//  HouseDetailsViewController.swift
//  KMHouses
//
//  Created by Pankaj Rathor on 15/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HouseDetailsViewController: UIViewController {
    
    @IBOutlet private weak var houseImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    
    var house: House?
    
    private var houseDataManager: HouseDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleDict = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict;
        
        houseDataManager = HouseDataManager.sharedManager
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setupHouseDetails()
    }
    
    func setupHouseDetails() {
        
        if let house = house {
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
            
            let imageName = String(format: "miniature%d.png", house.number)
            self.houseImageView.image = UIImage(named: imageName)
            
            self.numberLabel.text = String(format: "%02d", house.number)
        }
    }
}
