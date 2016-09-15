//
//  HouseListFlowLayout.swift
//  UICollectionViewFlowLayout subclass to define the layout of the cells in grid view.
//
//  Created by Pankaj Rathor on 15/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HouseListFlowLayout: UICollectionViewFlowLayout {
    
    let itemHeight: CGFloat = 90
    
    // initializers
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    // Sets up the layout for the collectionView. 0 distance between each cell, and vertical layout
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 1
        scrollDirection = .Vertical
    }
    
    // Calculates the width of the collection view item
    func itemWidth() -> CGFloat {
        
        let interfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        
        let idiom = UIDevice.currentDevice().userInterfaceIdiom
        
        var width: CGFloat = 90
        
        // Based on orientation and screen size of the device, calculate the item width.
        if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
            
            if (idiom == UIUserInterfaceIdiom.Pad) {
                width = (CGRectGetWidth(collectionView!.frame)/2)-1
            }
            else if (idiom == UIUserInterfaceIdiom.Phone) {
                width = (CGRectGetWidth(collectionView!.frame))-1
            }
        }
        else {
            if (idiom == UIUserInterfaceIdiom.Pad) {
                width = (CGRectGetWidth(collectionView!.frame)/2)-1
            }
            else if (idiom == UIUserInterfaceIdiom.Phone) {
                width = (CGRectGetWidth(collectionView!.frame)/2)-1
            }
        }
        
        return width
    }
    
    // Calculate the item size.
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSizeMake(itemWidth(), itemHeight)
        }
        get {
            return CGSizeMake(itemWidth(), itemHeight)
        }
    }
}

