//
//  BubbleSort.swift
//  Sort
//
//  Created by Shawn Frank on 4/5/2025.
//

extension MutableCollection where Element: Comparable {
    // O(n^2) time and in place
    mutating func bubbleSorted() {
        guard count > 1 else { return }
        
        var isSorted = true
        
        repeat {
            isSorted = true
            var currentIndex = index(after: startIndex)
            var previousIndex = startIndex
            
            while currentIndex < endIndex {
                if self[currentIndex] < self[previousIndex] {
                    isSorted = false
                    swap(currentIndex, previousIndex)
                }
                
                previousIndex = currentIndex
                formIndex(after: &currentIndex)
            }
            
        } while !isSorted
    }
}
