/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    // original: clone
    var dict = [Node: Node]()
    func copyRandomList(_ head: Node?) -> Node? {
        var current = head
        while current != nil {
            if dict[current!] == nil {
                let copy = Node(current!.val)
                dict[current!] = copy
            }

            if let next = current?.next {
                if dict[next] == nil {
                    let nextCopy = Node(next.val)
                    dict[next] = nextCopy
                    dict[current!]?.next = nextCopy   
                } else {
                    dict[current!]?.next = dict[next]
                }
            }

            if let random = current?.random {
                if dict[random] == nil {
                    let randomCopy = Node(random.val)
                    dict[random] = randomCopy
                    dict[current!]?.random = randomCopy   
                } else {
                    dict[current!]?.random = dict[random]
                }
            }

            current = current?.next
        }
        if head == nil { return nil }
        return dict[head!]
    }
}