//
//  main.swift
//  121 - Best time to buy and sell stock
//
//  Created by Shawn Frank on 24/4/2025.
//
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
//  https://www.youtube.com/watch?v=1pkOgXD63yU&ab_channel=NeetCode

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit = 0
    
    var buyPointer = 0
    var sellPointer = buyPointer + 1
    
    while sellPointer < prices.count {
        let buy = prices[buyPointer]
        let sell = prices[sellPointer]
        
        let currentProfit = sell - buy
        
        maxProfit = max(maxProfit, currentProfit)
        
        if sell < buy {
            buyPointer = sellPointer
        }
        
        sellPointer += 1
    }
    
    return maxProfit
}

print(maxProfit([7,1,5,3,6,4]))
print(maxProfit([7,6,4,3,1]))

