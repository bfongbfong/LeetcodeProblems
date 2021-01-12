/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var nodes = [ListNode]()
        var dummyHead = head 
        
        var curr = head 
        while curr != nil {
            nodes.append(curr!)
            curr = curr!.next
        }
        
        let removeIndex = nodes.count - n
        let nodeToRemove = nodes[removeIndex]
        if removeIndex - 1 >= 0 {
            let prev = nodes[removeIndex - 1]
            prev.next = nodeToRemove.next
        } else {
            // remove the first node
            return dummyHead?.next
        }
        return dummyHead
    }
}
