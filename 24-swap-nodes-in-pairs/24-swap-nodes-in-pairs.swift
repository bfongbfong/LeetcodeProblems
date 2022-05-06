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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var dummyHead: ListNode? = ListNode()
        dummyHead?.next = head

        var curr = dummyHead
        while curr != nil && curr?.next?.next != nil {
            let temp = curr?.next
            curr?.next = curr?.next?.next
            curr = curr?.next
            let nextTemp = curr?.next
            curr?.next = temp
            curr = curr?.next
            curr?.next = nextTemp
        }
        return dummyHead?.next
    }
}