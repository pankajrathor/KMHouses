//
//  HousesCollectionViewController.swift
//  HousesCollectionViewController displays a grid or list of houses available in the Miniature collection.
//
//  Created by Pankaj Rathor on 14/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HousesCollectionViewController: UIViewController, UICollectionViewDataSource {

    // IBOutlet is made private to avoid external access
    @IBOutlet private weak var houseCollectionView: UICollectionView!
    
    // houseDataManager to access the houses data from the data source
    private var houseDataManager: HouseDataManager?
    
    // Flow layout objects to switch the flow layout if the collection view
    private var houseGridFlowLayout = HouseGridFlowLayout()
    private var houseListFlowLayout = HouseListFlowLayout()
    
    // Flag to track if grid view or list view is displayed.
    private var gridFlowLayout = true
    private var selectedHouseIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the title color of the navigation bar to white color
        let titleDict = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict;
        
        self.houseDataManager = HouseDataManager.sharedManager
        
        // Load the data from the data source
        self.houseDataManager?.load()
        
        // Set the flow layout of the collection view
        if (self.gridFlowLayout) {
            self.houseCollectionView.collectionViewLayout = houseGridFlowLayout
        }
        else {
            self.houseCollectionView.collectionViewLayout = houseListFlowLayout
        }

        self.houseCollectionView.reloadData()
    }


    // MARK: Collection view Data source methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houseDataManager!.count()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let houseCell = collectionView.dequeueReusableCellWithReuseIdentifier(HouseListCell.cellIdentifier, forIndexPath: indexPath) as! HouseListCell

        // Get the House details for the row
        let house = houseDataManager![indexPath.row]

        // Setup the cell with house details
        houseCell.setHouseData(house)
        
        return houseCell
    }
    
    @IBAction func galleryButtonClicked(sender: AnyObject) {
    
        // Toggle the flow layout being used
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
        
        // Reload the collection view with new flow layout
        self.houseCollectionView.reloadData()
    }
    
    // Pass the selected House index to the destination view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let houseDetailsViewController = segue.destinationViewController as? HouseDetailsViewController {
            houseDetailsViewController.houseIndex = selectedHouseIndex
        }
    }
}

extension HousesCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedHouseIndex = indexPath.row  // Save the selected cell index for future reference
    
        // initiate the segue to show HouseDetailsViewController
        self.performSegueWithIdentifier("showHouseDetailsSegue", sender: nil);
    }
}

