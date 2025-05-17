//
//  main.swift
//  Prefix Trie
//
//  Created by Shawn Frank on 18/5/2025.
//

import Foundation

class Trie {
    
    class TrieNode {
        var next = [Character: TrieNode]()
        var isWordEnd = false
    }
    
    var root: TrieNode
    
    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        var node = root
        
        for char in word {
            node = insertInternal(char, at: node)
        }
        
        node.isWordEnd = true
    }
    
    private func insertInternal(_ char: Character, at node: TrieNode) -> TrieNode {
        if let nextNode = node.next[char] {
            return nextNode
        }
        
        let nextNode = TrieNode()
        node.next[char] = nextNode
        return nextNode
    }
    
    func search(_ word: String) -> Bool {
        var currentNode = root
        
        for char in word {
            if let nextNode = currentNode.next[char] {
                currentNode = nextNode
                continue
            }
            
            return false
        }
        
        return currentNode.isWordEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        
        for char in prefix {
            if let nextNode = currentNode.next[char] {
                currentNode = nextNode
                continue
            }
            
            return false
        }
        
        return true
    }
}

let trie = Trie()
trie.insert("apple")
print(trie.search("apple"))
print(trie.search("app"))
print(trie.startsWith("app"))
trie.insert("app")
print(trie.search("app"))
