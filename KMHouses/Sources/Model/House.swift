//
//  House.swift
//  Model class that represents the House details.
//
//  Created by Pankaj Rathor on 14/09/16.
//  Copyright © 2016 Sogeti B.V. All rights reserved.
//

import Foundation

class House: NSObject {
    
    var name: String?
    var address: String?
    var number: Int = 0
    var descriptionEnglish: String?
    var descriptionDutch: String?
    var latitude: Float?
    var longitude: Float?
    var imageName: String?
    var collectedCount: Int = 0
    var realImageName: String?
    var movie: String?
    
    init(dictionary: Dictionary<String, AnyObject>) {
        
        if let name = dictionary[Constants.Name] {
            self.name = name as? String
        }
        
        if let address = dictionary[Constants.Address] {
            self.address = address as? String
        }
        
        if let number = dictionary[Constants.Number] {
            self.number = number as! Int
        }
        
        if let descriptionEnglish = dictionary[Constants.DescriptionEnglish] {
            self.descriptionEnglish = descriptionEnglish as? String
        }
        
        if let descriptionDutch = dictionary[Constants.DescriptionDutch] {
            self.descriptionDutch = descriptionDutch as? String
        }
        
        if let latitude = dictionary[Constants.Latitude] {
            self.latitude = latitude as? Float
        }
        
        if let longitude = dictionary[Constants.Longitude] {
            self.longitude = longitude as? Float
        }
        
        if let imageName = dictionary[Constants.Image] {
            self.imageName = imageName as? String
        }
        
        if let collectedCount = dictionary[Constants.CollectedCount] {
            self.collectedCount = collectedCount as! Int
        }
        
        if let realImageName = dictionary[Constants.RealImageName] {
            self.realImageName = realImageName as? String
        }
        
        if let movie = dictionary[Constants.Movie] {
            self.movie = movie as? String
        }
        
    }
}
