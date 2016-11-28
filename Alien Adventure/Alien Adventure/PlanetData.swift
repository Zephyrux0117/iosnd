//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        let dataURL = Bundle.main.url(forResource: dataFile, withExtension: "json")!
        let dataJson = try! Data(contentsOf: dataURL)
        
        var planets: NSArray!
        do {
            planets = try! JSONSerialization.jsonObject(with: dataJson, options: JSONSerialization.ReadingOptions()) as! NSArray
        }
        var result = ""
        var topRate = 0
        for planet in planets {
            if let planet = planet as? [String:Any] {
                let common = planet["CommonItemsDetected"] as! Int
                let uncommon = planet["UncommonItemsDetected"] as! Int
                let rare = planet["RareItemsDetected"] as! Int
                let legendary = planet["LegendaryItemsDetected"] as! Int
                let rate = common + uncommon * 2 + rare * 3 + legendary * 4
                if rate > topRate {
                    result = planet["Name"] as! String
                    topRate = rate
                }
            }
        }
        return result
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"
