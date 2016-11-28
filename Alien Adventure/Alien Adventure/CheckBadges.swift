//
//  CheckBadges.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func checkBadges(badges: [Badge], requestTypes: [UDRequestType]) -> Bool {
        
        let allBadges = badges
        for request in requestTypes {
            var flag = false
            for badge in allBadges {
                if badge.requestType == request {
                    flag = true
                    break
                }
            }
            if !flag {
                return false
            }
        }
        return true
    }
    
}
