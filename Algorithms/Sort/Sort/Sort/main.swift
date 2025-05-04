//
//  main.swift
//  Sort
//
//  Created by Shawn Frank on 4/5/2025.
//

import Foundation

var originalArray = [-5, 7, 1, -1, 8, 6, 3, -1, 0]
print("Original array: \(originalArray)")
originalArray.bubbleSorted()
print("Bubble sorted: \(originalArray)")

originalArray = [-5, 7, 1, -1, 8, 6, 3, -1, 0]
print("Original array: \(originalArray)")
originalArray.insertionSorted()
print("Insertion sorted: \(originalArray)")

var originalStringArray = ["Sam", "Faiq", "Yasmin", "Emma", "Troy", "Kevin", "Shawn"]
print("Original array: \(originalStringArray)")
originalStringArray.insertionSorted()
print("Selection sorted: \(originalStringArray)")

originalArray = [-5, 7, 1, -1, 8, 6, 3, -1, 0]
print("Original array: \(originalArray)")
originalArray.mergeSort()
print("Merge sorted: \(originalArray)")

originalArray = [-5, 7, 1, -1, 8, 6, 3, -1, 0]
print("Original array: \(originalArray)")
originalArray.quickSorted()
print("Quick sorted: \(originalArray)")
