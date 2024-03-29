/**
 * Definition for ImmutableListNode.
 * public class ImmutableListNode {
 *     public func printValue() {}
 *     public func getNext() -> ImmutableListNode? {}
 * }
 */

class Solution {
    func printLinkedListInReverse(_ head: ImmutableListNode?) {
        guard let head = head else { return }
        printLinkedListInReverse(head.getNext())
        head.printValue()
    }
}