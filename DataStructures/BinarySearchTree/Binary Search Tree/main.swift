//
//  main.swift
//  Binary Search Tree
//
//  Created by Shawn Frank on 25/4/2025.
//

import Foundation

let bst = BinarySearchTree<Int>()

print(bst.isEmpty)

bst.insert(7)
bst.insert(20)
bst.insert(5)
bst.insert(15)
bst.insert(10)
bst.insert(4)
bst.insert(4)
bst.insert(33)
bst.insert(2)
bst.insert(25)
bst.insert(6)

bst.printPreOrder()
bst.printPostOrder()
bst.printInOrder()
bst.printLevelOrder()

print("Does 33 exist: \(bst.find(33))")
print("Does 89 exist: \(bst.find(89))")

if bst.remove(20) {
    print("20 was removed from the BST")
}

if !bst.remove(89) {
    print("89 does not exist in the BST")
}

bst.printLevelOrder()
