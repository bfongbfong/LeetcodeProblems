/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
​
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        var firstNode = head
        var secondNode = head?.next
​
        while firstNode !== secondNode {
            if firstNode == nil || secondNode == nil {
                return false
            }
            firstNode = firstNode?.next
            secondNode = secondNode?.next?.next
        }
        
        return true
    }
}
