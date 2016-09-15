//
//  HouseDataManager.swift
//  KMHouses
//
//  Created by Pankaj Rathor on 14/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import Foundation

class HouseDataManager {
    
    var houseList: Array<House>?
    
    init(array: [AnyObject]) {
        
        self.houseList = Array()
        
    }
    
    func load(plistNamed: String) {
        
//        for value in array {
//            let houseDictionary = value as! Dictionary<String, AnyObject>
//            
//            let house = House(dictionary: houseDictionary)
//            
//            self.houseList?.append(house)
//        }
    }
    
    
}