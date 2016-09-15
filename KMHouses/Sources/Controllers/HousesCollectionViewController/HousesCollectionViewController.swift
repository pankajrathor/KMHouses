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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let titleDict = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Collection view Data source methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var houseCell = collectionView.dequeueReusableCellWithReuseIdentifier("", forIndexPath: indexPath)
        
        return houseCell
    }
}

