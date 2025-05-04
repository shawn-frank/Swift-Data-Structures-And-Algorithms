//
//  main.swift
//  Grid traveller
//
//  Created by Shawn Frank on 5/5/2025.
//

import Foundation

func gridTraveller(rows: Int, cols: Int) -> Int {
    
    var gridMemo = [Set(arrayLiteral: [1, 1]): 1]
    
    func gridTravellerRecursive(rows: Int, cols: Int) -> Int {
        if rows == 0 || cols == 0 { return 0 }
        
        if let result = gridMemo[Set(arrayLiteral: [rows, cols])] {
            return result
        }
        
        let result = gridTravellerRecursive(rows: rows - 1, cols: cols)
        + gridTravellerRecursive(rows: rows, cols: cols - 1)
        
        gridMemo[Set(arrayLiteral: [rows, cols])] = result
        
        return result
    }
    
    return gridTravellerRecursive(rows: rows, cols: cols)
}

print(gridTraveller(rows: 1, cols: 1)) // 1
print(gridTraveller(rows: 2, cols: 3)) // 3
print(gridTraveller(rows: 3, cols: 3)) // 6
print(gridTraveller(rows: 18, cols: 18)) // 2333606220
