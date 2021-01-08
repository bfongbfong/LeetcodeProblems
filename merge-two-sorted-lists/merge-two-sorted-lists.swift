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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // iterate through both 
        // if they are the same, add both 
        // if one is lower than the other, add the lower one and move that one next. repeat. 
        if l1 == nil && l2 == nil { return nil }
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var listOne = l1
        var listTwo = l2
        
        var dummyHead = ListNode(0)
        var finalList: ListNode? = dummyHead
        
        func append(_ newList: ListNode) {
            finalList!.next = ListNode(newList.val)
            finalList = finalList!.next
        }
        
        while listOne != nil || listTwo != nil {
            
            if listOne == nil && listTwo != nil {
                append(listTwo!)
                listTwo = listTwo!.next
            } else if listTwo == nil && listOne != nil {
                append(listOne!)
                listOne = listOne!.next
            }
            
            else if listOne!.val == listTwo!.val {
                append(listOne!)
                append(listTwo!)
                listOne = listOne!.next
                listTwo = listTwo!.next
            }
            else if listOne!.val < listTwo!.val {
                append(listOne!)
                listOne = listOne!.next
            }
            else {
                append(listTwo!)
                listTwo = listTwo!.next
            }
        }
        return dummyHead.next
    }
}
