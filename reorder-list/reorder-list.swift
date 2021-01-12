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
    func reorderList(_ head: ListNode?) {
        var curr = head 
        var nodes = [ListNode]()
        while curr != nil {
            nodes.append(curr!)
            curr = curr!.next
        }
​
        curr = head
        var i = 0
        var backCounted = false
        var frontCounted = false
        var n = 0
        while i < nodes.count {
            if i == 0 {
                frontCounted = true
            }
            
            if frontCounted {
                curr!.next = nodes[nodes.count - 1 - n]
                backCounted = true
            }
            else {
                curr!.next = nodes[n]
                frontCounted = true
            } 
            if i == nodes.count - 1 {
                curr?.next = nil
                break
            }
            
            curr = curr!.next
            
            if backCounted && frontCounted {
                n += 1
                backCounted = false
                frontCounted = false
            }
            i += 1
        }
    }
}
