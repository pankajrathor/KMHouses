//
//  HousesCollectionViewController.swift
//  KMHouses
//
//  Created by Pankaj Rathor on 14/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HousesCollectionViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var houseCollectionView: UICollectionView!
    
    var houseDataManager: HouseDataManager?
    
    var houseGridFlowLayout = HouseGridFlowLayout()
    var houseListFlowLayout = HouseListFlowLayout()
    
    var gridFlowLayout = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let titleDict = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict;
        
        self.houseDataManager = HouseDataManager()
        
        if let jsonFileName = NSBundle.mainBundle().pathForResource("Miniatures", ofType: "json") {
            
            self.houseDataManager?.load(jsonFileName)
            
        }
        
        if (self.gridFlowLayout) {
            self.houseCollectionView.collectionViewLayout = houseGridFlowLayout
        }
        else {
            self.houseCollectionView.collectionViewLayout = houseListFlowLayout
        }

        self.houseCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Collection view Data source methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houseDataManager!.count()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if (self.gridFlowLayout) {
        
            let houseCell = collectionView.dequeueReusableCellWithReuseIdentifier(HouseListCell.cellIdentifier, forIndexPath: indexPath) as! HouseListCell
            
            let house = houseDataManager![indexPath.row]
            
            houseCell.setHouseData(house)
            
            return houseCell
        }
        else {
            let houseCell = collectionView.dequeueReusableCellWithReuseIdentifier(HouseListCell.cellIdentifier, forIndexPath: indexPath) as! HouseListCell
            
            let house = houseDataManager![indexPath.row]

            houseCell.setHouseData(house)
            
            return houseCell
        }
    }
    @IBAction func galleryButtonClicked(sender: AnyObject) {
        
        let segmentedControl = sender as! UISegmentedControl
        
        if (segmentedControl.selectedSegmentIndex == 0) {
            self.gridFlowLayout = !self.gridFlowLayout
            
            if gridFlowLayout {
                UIView.animateWithDuration(0.2) { () -> Void in
                    self.houseCollectionView.collectionViewLayout.invalidateLayout()
                    self.houseCollectionView.setCollectionViewLayout(self.houseGridFlowLayout, animated: true)
                }
            }
            else {
                UIView.animateWithDuration(0.2) { () -> Void in
                    self.houseCollectionView.collectionViewLayout.invalidateLayout()
                    self.houseCollectionView.setCollectionViewLayout(self.houseListFlowLayout, animated: true)
                }
            }
            
            self.houseCollectionView.reloadData()
        }
        else {
            // Handle globe tapped event
        }
    }
}

extension HousesCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
    }
}

