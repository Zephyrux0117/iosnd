//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        
        if inventory.count < 1 {
            return nil
        }
        var counts = [Character:Int]()
        for item in inventory {
            for char in item.name.lowercased().characters {
                if let count = counts[char] {
                    counts[char] = count + 1
                } else {
                    counts[char] = 1
                }
            }
        }
        
        var result = Character("a")
        var topCount = 0
        for item in counts {
            if item.value > topCount {
                result = item.key
                topCount = item.value
            }
        }
        return result
    }
}
