//
//  main.swift
//  875 - Koko eating bananas
//
//  Created by Shawn Frank on 16/5/2025.
//
//  https://leetcode.com/problems/koko-eating-bananas/description/

import Foundation

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    var minBananas = 1
    var maxBananas = Int.min
    
    for bananas in piles {
        maxBananas = max(maxBananas, bananas)
    }
    
    var minBananasPerHour = maxBananas
    
    while minBananas <= maxBananas {
        let proposedSpeed = (minBananas + maxBananas) / 2
        
        var hoursToEat = 0
        
        for bananas in piles {
            hoursToEat += Int(ceil(Double(bananas) / Double(proposedSpeed)))
        }
        
        if hoursToEat <= h {
            minBananasPerHour = min(minBananasPerHour,
                                    proposedSpeed)
            
            maxBananas = proposedSpeed - 1
        } else {
            minBananas = proposedSpeed + 1
        }
    }
    
    return minBananasPerHour
}


print(minEatingSpeed([3,6,7,11], 8)) // 4
print(minEatingSpeed([30,11,23,4,20], 5)) // 30
print(minEatingSpeed([30,11,23,4,20], 6)) // 23
