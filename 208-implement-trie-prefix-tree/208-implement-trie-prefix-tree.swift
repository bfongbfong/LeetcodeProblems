
class Trie {
    var headNode = TrieNode(val: " ")

    init() {
        
    }
    
    func insert(_ word: String) {
        var currentNode = headNode
        for (index, letter) in word.enumerated() {
            if let node = currentNode.next[letter] {
                currentNode = node
            } else {
                let newNode = TrieNode(val: letter)
                currentNode.next[letter] = newNode
                currentNode = newNode
            }
            if index == word.count - 1 {
                currentNode.endOfWord = true
            }
        }
    }
    
    func search(_ word: String) -> Bool {
        var currentNode = headNode
        for (index, letter) in word.enumerated() {
            if let node = currentNode.next[letter] {
                currentNode = node
            } else {
                return false
            }
            if index == word.count - 1 {
                if currentNode.endOfWord {
                    return true
                }
            }
        }
        return false
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = headNode
        for letter in prefix {
            if let node = currentNode.next[letter] {
                currentNode = node
            } else {
                return false
            }
        }
        return true
    }
}

class TrieNode {
    let val: Character
    init(val: Character) {
        self.val = val
    }
    var next: [Character: TrieNode] = [:]
    var endOfWord = false
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */