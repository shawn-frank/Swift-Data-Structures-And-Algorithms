//
//  SelectionSort.swift
//  Sort
//
//  Created by Shawn Frank on 4/5/2025.
//

extension MutableCollection where Element: Comparable {
    // O(n^2) time and in place
    mutating func selectionSorted() {
        guard count > 1 else { return }
        
        for index in indices {
            var minValue = self[index]
            var minIndex = index
            
            var currentIndex = self.index(after: index)
            
            while currentIndex < endIndex {
                if self[currentIndex] < minValue {
                    minValue = self[currentIndex]
                    minIndex = currentIndex
                }
                
                formIndex(after: &currentIndex)
            }
            
            swap(index, minIndex)
        }
    }
}
