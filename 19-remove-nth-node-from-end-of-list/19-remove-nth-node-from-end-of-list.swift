/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummyHead: ListNode? = ListNode(0)
        dummyHead?.next = head
        var left = dummyHead
        var right = head

        // shift right pointer by n
        for i in 0..<n {
            right = right?.next
        }

        while right != nil {
            left = left?.next
            right = right?.next
        }

        // now left is in the position one before the target
        left?.next = left?.next?.next
        return dummyHead?.next
    }
}