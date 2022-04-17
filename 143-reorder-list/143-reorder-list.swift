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
    func reorderList(_ head: ListNode?) {
        // use as slow pointer, which increments by 1
        // use a fast pointer which increments by 2. 
        // once the fast pointer reaches the end, the slow pointer indicates the halfway point
        var slow = head
        var fast = head?.next
        var firstCurr: ListNode?
        var secondCurr: ListNode?
        while fast != nil || fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        firstCurr = head
        secondCurr = reverseLinkedList(slow?.next)
        slow?.next = nil // split the two lists

        while secondCurr != nil {
            print(firstCurr!.val)
            print(secondCurr!.val)
            // set temp variables
            let firstTemp = firstCurr?.next 
            let secondTemp = secondCurr?.next

            // replace the links with new ones
            firstCurr?.next = secondCurr
            secondCurr?.next = firstTemp

            // move pointers along
            firstCurr = firstTemp
            secondCurr = secondTemp
        }
        // need to change this entire implementation based on the fact that we need to change the list, not return a new one
    }

    func reverseLinkedList(_ head: ListNode?) -> ListNode? {
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
    // store the temporary property for left list's next (2), this is to remember 2 when 1 gets its next value replaced
    // store the temporary property for right lists's next (4) // this is to remember 4 when 5 gets its next value replaced
    // set firstList's next to secondList's head (5)
    // set secondList's next to firstLists's temp
    
    // question, are we doing all this on list 1 or making a new list?
}