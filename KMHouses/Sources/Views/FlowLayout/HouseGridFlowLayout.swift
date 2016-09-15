//
//  HouseGridFlowLayout.swift
//  UICollectionViewFlowLayout subclass to define the layout of the cells in grid view.
//
//  Created by Pankaj Rathor on 15/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HouseGridFlowLayout: UICollectionViewFlowLayout {
    
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
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .Vertical
    }
    
    // Calculates the width of the collection view item
    func itemWidth() -> CGFloat {
        
        let interfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        
        let idiom = UIDevice.currentDevice().userInterfaceIdiom
        
        var width: CGFloat = 90 // Default cell width
        
        
        // Based on orientation and screen size of the device, calculate the item width.
        if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
            
            if (idiom == UIUserInterfaceIdiom.Pad) {
                width = (CGRectGetWidth(collectionView!.frame)/8)-1
            }
            else if (idiom == UIUserInterfaceIdiom.Phone) {
                if (UIScreen.mainScreen().scale < 3) {
                    width = (CGRectGetWidth(collectionView!.frame)/4)-1
                }
                else {
                    width = (CGRectGetWidth(collectionView!.frame)/5)-1
                }
            }
        }
        else {
            if (idiom == UIUserInterfaceIdiom.Pad) {
                width = (CGRectGetWidth(collectionView!.frame)/11)-1
            }
            else if (idiom == UIUserInterfaceIdiom.Phone) {
                if (UIScreen.mainScreen().scale < 3) {
                    width = (CGRectGetWidth(collectionView!.frame)/7)-1
                }
                else {
                    width = (CGRectGetWidth(collectionView!.frame)/8)-1
                }

            }
        }
        
        return width
    }
    
    // Calculate the item size. In grid view, size is square
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSizeMake(itemWidth(), itemWidth())
        }
        get {
            return CGSizeMake(itemWidth(), itemWidth())
        }
    }
}
