//
//  InsertionSort.swift
//  Sort
//
//  Created by Shawn Frank on 4/5/2025.
//

extension MutableCollection where Element: Comparable {
    // O(n^2) time and in place
    mutating func insertionSorted() {
        guard count > 1 else { return }
        
        var currentIndex = index(after: startIndex)
        
        while currentIndex < endIndex {
            
            var comparisonIndex = currentIndex
            var previousIndex = index(comparisonIndex, offsetBy: -1)
            
            while previousIndex >= startIndex, self[comparisonIndex] < self[previousIndex] {
                swap(comparisonIndex, previousIndex)
                comparisonIndex = previousIndex
                formIndex(&previousIndex, offsetBy: -1)
            }
            
            formIndex(after: &currentIndex)
        }
    }
}
