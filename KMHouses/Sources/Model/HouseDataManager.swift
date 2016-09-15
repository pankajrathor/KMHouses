//
//  HouseDataManager.swift
//  KMHouses
//
//  Created by Pankaj Rathor on 14/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import Foundation
import SwiftyJSON

class HouseDataManager {
    
    var houseList: Array<House>?
    
    init() {
        
        self.houseList = Array()
        
    }
    
    func load(JSONNamed: String) {
        
        if let jsonData = NSData(contentsOfFile: JSONNamed) {
        
            var error: NSError?
            let json = JSON(data: jsonData, options: .AllowFragments, error: &error)
            
            if let readError = error {
                print("There was error reading JSON File: \(readError.description)")
            }
            else {
                if let houseDictionary = json.dictionary {
                    if let houseArray = houseDictionary["miniatures"] {
                        for houseJSON in houseArray {
                            let houseDetails = houseJSON.1
                            
                            if let house: House = House(dictionary: houseDetails.dictionaryObject!) {
                                self.houseList?.append(house)
                            }
                        }
                        
                        self.houseList?.sortInPlace{ (houseOne: House, houseTwo: House) in
                            
                            return houseOne.number > houseTwo.number
                        }
                    }
                }
            }
        }
    }
    
    func count() -> Int {
        
        return self.houseList!.count
        
    }
    
    subscript(index: Int) -> House {
        
        return self.houseList![index]
        
    }
    
}