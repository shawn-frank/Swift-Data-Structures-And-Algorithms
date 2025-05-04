//
//  MergeSort.swift
//  Sort
//
//  Created by Shawn Frank on 4/5/2025.
//

extension MutableCollection where Element: Comparable {
    mutating func mergeSort() {
        guard count > 1 else { return }
        let sorted = mergeSortInternal(Array(self))
        
        var index = startIndex
        for element in sorted {
            self[index] = element
            formIndex(after: &index)
        }
    }
    
    private func mergeSortInternal(_ array: [Element]) -> [Element] {
        guard array.count > 1 else { return array }
        
        let middle = array.count / 2
        
        let leftStartIndex = array.startIndex
        let leftEndIndex = array.index(array.startIndex, offsetBy: middle - 1)

        let rightStartIndex = array.index(leftStartIndex, offsetBy: middle)
        let rightEndIndex = array.index(array.startIndex, offsetBy: array.count - 1)

        let leftSorted = mergeSortInternal(Array(array[leftStartIndex...leftEndIndex]))
        let rightSorted = mergeSortInternal(Array(array[rightStartIndex...rightEndIndex]))
        
        return Array(merge(leftSorted, rightSorted))
    }
    
    private func merge(_ leftArray: [Element], _ rightArray: [Element]) -> [Element] {
        var resultArray = [Element]()
        
        var leftIndex = leftArray.startIndex
        var rightIndex = rightArray.startIndex
        
        while leftIndex < leftArray.endIndex, rightIndex < rightArray.endIndex {
            let leftValue = leftArray[leftIndex]
            let rightValue = rightArray[rightIndex]
            
            if leftValue < rightValue {
                resultArray.append(leftValue)
                leftArray.formIndex(after: &leftIndex)
            } else {
                resultArray.append(rightValue)
                rightArray.formIndex(after: &rightIndex)
            }
        }
        
        while leftIndex < leftArray.endIndex {
            let leftValue = leftArray[leftIndex]
            resultArray.append(leftValue)
            leftArray.formIndex(after: &leftIndex)
        }
        
        while rightIndex < rightArray.endIndex {
            let rightValue = rightArray[rightIndex]
            resultArray.append(rightValue)
            rightArray.formIndex(after: &rightIndex)
        }
        
        return resultArray
    }
}
