//
//  main.swift
//  36 - Valid Sudoku
//
//  Created by Shawn Frank on 23/4/2025.
//

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    var rowHashSet = [Int: Set<Character>]()
    var colHashSet = [Int: Set<Character>]()
    var gridHashSet = [String: Set<Character>]()
    let gridFactor = 3
    
    for row in 0 ..< board.count {
        
        for column in 0 ..< board[row].count {
            
            let currentValue = board[row][column]
            
            guard currentValue != "." else { continue }
            
            if rowHashSet[row]?.contains(currentValue) == true {
                return false
            }
            
            rowHashSet[row, default: Set<Character>()].insert(currentValue)
            
            if colHashSet[column]?.contains(currentValue) == true {
                return false
            }
            
            colHashSet[column, default: Set<Character>()].insert(currentValue)
            
            let gridIndex = "\(Int(row / gridFactor)),\(Int(column / gridFactor))"
            
            if gridHashSet[gridIndex]?.contains(currentValue) == true {
                return false
            }
            
            gridHashSet[gridIndex, default: Set< Character>()].insert(currentValue)
        }
    }
    
    return true
}

let boardOne: [[Character]] = [["5","3",".",".","7",".",".",".","."]
                ,["6",".",".","1","9","5",".",".","."]
                ,[".","9","8",".",".",".",".","6","."]
                ,["8",".",".",".","6",".",".",".","3"]
                ,["4",".",".","8",".","3",".",".","1"]
                ,["7",".",".",".","2",".",".",".","6"]
                ,[".","6",".",".",".",".","2","8","."]
                ,[".",".",".","4","1","9",".",".","5"]
                ,[".",".",".",".","8",".",".","7","9"]]

let boardTwo: [[Character]] = [["8","3",".",".","7",".",".",".","."]
                ,["6",".",".","1","9","5",".",".","."]
                ,[".","9","8",".",".",".",".","6","."]
                ,["8",".",".",".","6",".",".",".","3"]
                ,["4",".",".","8",".","3",".",".","1"]
                ,["7",".",".",".","2",".",".",".","6"]
                ,[".","6",".",".",".",".","2","8","."]
                ,[".",".",".","4","1","9",".",".","5"]
                ,[".",".",".",".","8",".",".","7","9"]]

print(isValidSudoku(boardOne))
print(isValidSudoku(boardTwo))
