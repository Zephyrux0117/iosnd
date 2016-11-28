//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1: String, s2: String, shuffle: String) -> Bool {
        if s1.characters.count == 0
            && s2.characters.count == 0
            && shuffle.characters.count == 0 {
            return true
        }
        
        if s1.characters.count + s2.characters.count != shuffle.characters.count {
            return false
        }
        
        var newS1 = ""
        var newS2 = ""
        for char in shuffle.characters {
            if s1.contains(String(char)) {
                newS1.append(char)
            }
            if s2.contains(String(char)) {
                newS2.append(char)
            }
        }
        if s1 == newS1 && s2 == newS2 {
            return true
        } else {
            return false
        }
        
    }
}
