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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var current: ListNode? = ListNode(0) // have to make a dummy node
        var first = l1
        var second = l2
        var head = current
        while first != nil || second != nil {
            // if the one list is empty, add the remainder of the other list
            if first == nil {
                // current = second
                current?.next = second
                current = current?.next
                second = second?.next
            } else if second == nil {
                current?.next = first
                // current = first
                current = current?.next
                first = first?.next
            } else if first!.val < second!.val {
                current?.next = first
                // current = first
                current = current?.next
                first = first?.next
            } else {
                current?.next = second
                // current = second
                current = current?.next
                second = second?.next
            }
        }
        return head?.next
    }
}