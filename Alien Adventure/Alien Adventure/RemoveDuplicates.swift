//
//  RemoveDuplicates.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func removeDuplicates(inventory: [UDItem]) -> [UDItem] {
        var result = Set<UDItem>()
        for item in inventory {
            result.insert(item)
        }
        return Array(result)
    }
    
}
