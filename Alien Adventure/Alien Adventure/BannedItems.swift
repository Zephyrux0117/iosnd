//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        let dataFileURL = Bundle.main.url(forResource: dataFile, withExtension: "plist")!
        let itemList = NSArray(contentsOf: dataFileURL) as! [[String:Any]]
        
        var result = [Int]()
        for item in itemList {
            if let name = item["Name"] as? String, name.contains("Laser") {
                if let dict = item["HistoricalData"] as? [String:Any], let age = dict["CarbonAge"] as? Int, age < 30 {
                    if let id = item["ItemID"] as? Int {
                        result.append(id)
                    }
                }
            }
        }
        return result
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"
