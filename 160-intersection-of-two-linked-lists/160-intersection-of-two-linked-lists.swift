/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        // store them both into arrays and go backwards
        var a = headA
        var aArray = [ListNode]()
        while a != nil {
            aArray.append(a!)
            a = a?.next
        }

        var b = headB
        var bArray = [ListNode]()
        while b != nil {
            bArray.append(b!)
            b = b?.next
        }
        
        var lastIntersected: ListNode?
        var aTail = aArray.popLast()
        var bTail = bArray.popLast()
        while aTail != nil && bTail != nil {
            if aTail === bTail {
                lastIntersected = aTail
            } else {
                return lastIntersected
            }
            aTail = aArray.popLast()
            bTail = bArray.popLast()
        }

        return lastIntersected
    }
}