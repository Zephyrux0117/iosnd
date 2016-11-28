//
//  RarityOfItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func rarityOfItems(inventory: [UDItem]) -> [UDItemRarity:Int] {
        var rarity = [UDItemRarity.common: 0, UDItemRarity.uncommon: 0, UDItemRarity.rare: 0, UDItemRarity.legendary: 0]
        
        for item in inventory {
            switch item.rarity {
            case .common:
                rarity[UDItemRarity.common]! += 1
            case .uncommon:
                rarity[UDItemRarity.uncommon]! += 1
            case .rare:
                rarity[UDItemRarity.rare]! += 1
            case .legendary:
                rarity[UDItemRarity.legendary]! += 1
            }
        }
        return rarity
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 4"
