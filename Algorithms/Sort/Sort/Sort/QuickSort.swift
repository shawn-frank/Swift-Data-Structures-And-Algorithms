//
//  QuickSort.swift
//  Sort
//
//  Created by Shawn Frank on 4/5/2025.
//

extension MutableCollection where Self: BidirectionalCollection, Element: Comparable {
    mutating func quickSorted() {
        guard count > 1 else { return }
        let lastIndex = index(before: endIndex)
        quickSortedInternal(leftIndex: startIndex, rightIndex: lastIndex)
    }

    private mutating func quickSortedInternal(leftIndex: Index, rightIndex: Index) {
        guard leftIndex < rightIndex else { return }

        let partitionIndex = partition(leftIndex: leftIndex, rightIndex: rightIndex)

        if partitionIndex > leftIndex {
            let beforePivot = index(before: partitionIndex)
            quickSortedInternal(leftIndex: leftIndex, rightIndex: beforePivot)
        }
        
        let afterPivot = index(after: partitionIndex)
        
        if afterPivot < rightIndex {
            quickSortedInternal(leftIndex: afterPivot, rightIndex: rightIndex)
        }
    }

    private mutating func partition(leftIndex: Index, rightIndex: Index) -> Index {
        let pivot = self[rightIndex]
        var currentIndex = leftIndex
        var lesserThanPivotIndex = leftIndex

        while currentIndex < rightIndex {
            if self[currentIndex] < pivot {
                swapAt(currentIndex, lesserThanPivotIndex)
                formIndex(after: &lesserThanPivotIndex)
            }
            
            formIndex(after: &currentIndex)
        }

        swapAt(lesserThanPivotIndex, rightIndex)
        return lesserThanPivotIndex
    }
}
