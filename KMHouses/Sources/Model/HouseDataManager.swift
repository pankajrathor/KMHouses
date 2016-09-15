//
//  HouseDataManager.swift
//  HouseDataManager is the data manager for accessing the House model object. A singleton object of this class should be used.
//
//  Created by Pankaj Rathor on 14/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import Foundation
import SwiftyJSON

class HouseDataManager {
    
    // Shared instance of the class
    static let sharedManager = HouseDataManager()
    
    // List of house details
    var houseList: Array<House>?
    
    // External initialization is not allowed.
    private init() {
        self.houseList = Array()
    }
    
    // Load the JSON data from the JSON file
    func load() {
        
        if let jsonFileName = NSBundle.mainBundle().pathForResource("Miniatures", ofType: "json") {
            
            if let jsonData = NSData(contentsOfFile: jsonFileName) {
            
                // SwiftyJSON object is used for parsing the file data
                let json = JSON(data: jsonData)
                
                // Extracting the house details and storing in the houseList
                if let houseDictionary = json.dictionary {
                    if let houseArray = houseDictionary[Constants.Miniatures] {
                        for houseJSON in houseArray {
                            let houseDetails = houseJSON.1
                            
                            if let house: House = House(dictionary: houseDetails.dictionaryObject!) {
                                self.houseList?.append(house)
                            }
                        }
                        
                        // Sort the array in descending order of House Number
                        self.houseList?.sortInPlace{ (houseOne: House, houseTwo: House) in
                            return houseOne.number > houseTwo.number
                        }
                    }
                }
            }
        }
    }
    
    // Returns the count of Houses details
    func count() -> Int {
        return self.houseList!.count
    }
    
    // Subscript to return the House object at the specified index
    subscript(index: Int) -> House {
        return self.houseList![index]
    }
}