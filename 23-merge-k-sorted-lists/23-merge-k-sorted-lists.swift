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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        var dummyHead: ListNode? = ListNode()
        var current = dummyHead
        while true {
            // find min, remove it from that array and add it to the answer. repeat
            var minVal = Int.max
            var minNodeIndex = -1
            for i in 0..<lists.count {
                if let firstNode = lists[i], firstNode.val < minVal {
                    minNodeIndex = i
                    minVal = firstNode.val
                }
            }
            if minNodeIndex == -1 { break }
            current?.next = lists[minNodeIndex]
            current = current?.next
            lists[minNodeIndex] = lists[minNodeIndex]?.next
        }

        return dummyHead?.next
    }
}