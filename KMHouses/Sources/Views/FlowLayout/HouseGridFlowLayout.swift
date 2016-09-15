//
//  HouseGridFlowLayout.swift
//  KMHouses
//
//  Created by Pankaj Rathor on 15/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import UIKit

class HouseGridFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    /**
     Sets up the layout for the collectionView. 0 distance between each cell, and vertical layout
     */
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .Vertical
    }
    
    func itemWidth() -> CGFloat {
        return (CGRectGetWidth(collectionView!.frame)/4)-1
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSizeMake(itemWidth(), itemWidth())
        }
        get {
            return CGSizeMake(itemWidth(), itemWidth())
        }
    }
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
