//
//  SortLeastToGreatest.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func sortLeastToGreatest(inventory: [UDItem]) -> [UDItem] {
        
        return inventory.sorted(by: {(itemA, itemB) -> Bool in
            if itemA.rarity.rawValue < itemB.rarity.rawValue {
                return true
            }
            if itemA.rarity.rawValue == itemB.rarity.rawValue {
                return itemA.baseValue < itemB.baseValue
            }
            return false
        })
    }
    
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 5"
