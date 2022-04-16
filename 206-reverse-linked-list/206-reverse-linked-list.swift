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
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 1 -> 2 -> 3
        var current: ListNode?
        current = head
        var next: ListNode?
        while current != nil {
            let temp = current!.next // save the spot of the next element
            current!.next = next
            next = current
            current = temp
        }
        return next
    }
}