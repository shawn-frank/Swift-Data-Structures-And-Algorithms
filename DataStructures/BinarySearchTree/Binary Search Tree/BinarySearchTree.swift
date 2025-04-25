//
//  BinarySearchTree.swift
//  Binary Search Tree
//
//  Created by Shawn Frank on 25/4/2025.
//

private class Node<T: Comparable> {
    var data: T
    var left: Node?
    var right: Node?
    
    init(data: T) {
        self.data = data
    }
}


class BinarySearchTree<T: Comparable> {
    private var root: Node<T>?
    
    private func insert(_ node: Node<T>, root: Node<T>) {
        if node.data <= root.data {
            if let left = root.left {
                insert(node, root: left)
            } else {
                root.left = node
            }
        }
        
        if node.data > root.data {
            if let right = root.right {
                insert(node, root: right)
            } else {
                root.right = node
            }
        }
    }
    
    private func remove(_ data: T, currentRoot: Node<T>?) -> Node<T>? {
        guard let currentRoot else { return currentRoot }
        
        if data < currentRoot.data {
            currentRoot.left = remove(data, currentRoot: currentRoot.left)
        } else if data > currentRoot.data {
            currentRoot.right = remove(data, currentRoot: currentRoot.right)
        } else {
            // Remove a leaf node
            if currentRoot.left == nil && currentRoot.right == nil {
                return nil
            }
            
            // Remove a node with only a left sub tree
            if currentRoot.left != nil && currentRoot.right == nil {
                return currentRoot.left
            }
            
            // Remove a node with only a right sub tree
            if currentRoot.right != nil && currentRoot.left == nil {
                return currentRoot.right
            }
            
            // Removing a node that has both a left and right sub tree
            // So we opt for replacing the node with the max on the left sub tree
            if let nextRoot = digLeft(from: currentRoot.right) {
                currentRoot.data = nextRoot.data
                currentRoot.right = remove(nextRoot.data, currentRoot: currentRoot.right)
            }
        }
        
        return currentRoot
    }
    
    private func digLeft(from node: Node<T>?) -> Node<T>? {
        guard let left = node?.left else { return node }
        return digLeft(from: left)
    }
    
    private func digRight(from node: Node<T>?) -> Node<T>? {
        guard let right = node?.right else { return node }
        return digRight(from: right)
    }
    
    // MARK: Traversals
    private func printPreOrder(from currentRoot: Node<T>?) {
        guard let currentRoot else { return }
        
        print(currentRoot.data)
        printPreOrder(from: currentRoot.left)
        printPreOrder(from: currentRoot.right)
    }
    
    private func printInOrder(from currentRoot: Node<T>?) {
        guard let currentRoot else { return }
        
        printInOrder(from: currentRoot.left)
        print(currentRoot.data)
        printInOrder(from: currentRoot.right)
    }
    
    private func printPostOrder(from currentRoot: Node<T>?) {
        guard let currentRoot else { return }
        
        printPostOrder(from: currentRoot.left)
        printPostOrder(from: currentRoot.right)
        print(currentRoot.data)
    }
    
    private func find(_ data: T, currentRoot: Node<T>?) -> Node<T>? {
        guard let currentRoot else { return nil }
        
        if currentRoot.data == data { return currentRoot }
        
        if data < currentRoot.data {
            return find(data, currentRoot: currentRoot.left)
        }
        
        return find(data, currentRoot: currentRoot.right)
    }
    
    private func findParent(_ data: T, currentRoot: Node<T>?) -> Node<T>? {
        guard let currentRoot else { return nil }
        
        if currentRoot.data == data { return currentRoot }
        
        if data < currentRoot.data {
            return find(data, currentRoot: currentRoot.left)
        }
        
        return find(data, currentRoot: currentRoot.right)
    }
}

// MARK: Interface
extension BinarySearchTree {
    var isEmpty: Bool {
        root == nil
    }
    
    func insert(_ data: T) {
        let newNode = Node(data: data)
        
        guard let root else {
            root = newNode
            return
        }
        
        insert(newNode, root: root)
    }
    
    func printPreOrder() {
        print("** BST PRE ORDER **")
        printPreOrder(from: root)
        print()
    }
    
    func printInOrder() {
        print("** BST IN ORDER **")
        printInOrder(from: root)
        print()
    }
    
    func printPostOrder() {
        print("** BST POST ORDER **")
        printPostOrder(from: root)
        print()
    }
    
    func printLevelOrder() {
        print("** BST LEVEL ORDER **")
        
        guard let root else { return }
        
        var queue = [root]
        
        while !queue.isEmpty {
            guard let currentNode = queue.first else { return }
            
            print(currentNode.data)
            queue.removeFirst()
            
            if let left = currentNode.left {
                queue.append(left)
            }
            
            if let right = currentNode.right {
                queue.append(right)
            }
        }
        
        print()
    }
    
    func find(_ data: T) -> Bool {
        find(data, currentRoot: root) != nil
    }
    
    func remove(_ data: T) -> Bool {
        guard find(data) else { return false }
        
        let _ = remove(data, currentRoot: root)
        return true
    }
}
