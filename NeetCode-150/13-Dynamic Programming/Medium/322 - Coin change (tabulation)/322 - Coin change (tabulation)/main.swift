//
//  main.swift
//  322 - Coin change (tabulation)
//
//  Created by Shawn Frank on 26/5/2025.
//
//  https://leetcode.com/problems/coin-change/description/

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var result = Array(repeating: -1, count: amount + 1)
    result[0] = 0
    
    var total = 1
    
    while total <= amount {
        
        var minCoins: Int?
        
        for coin in coins {
            
            let remainder = total - coin
            
            guard remainder >= 0, result[remainder] > -1 else { continue }
            
            let numberOfCoins = result[remainder] + 1
            
            minCoins = min(minCoins ?? Int.max, numberOfCoins)
        }
        
        if let minCoins {
            result[total] = minCoins
        }
        
        total += 1
    }
    
    return result[amount]
}

print(coinChange([1,2,5], 11)) // 3
print(coinChange([2], 3)) // -1
print(coinChange([1], 0)) // 0

