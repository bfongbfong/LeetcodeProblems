/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *     public var parent: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.parent = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ p: Node?, _ q: Node?) -> Node? {
        var currP = p
        var currQ = q
        var values = Set<Int>()
        while currQ != nil || currP != nil {
            if currP === currQ {
                return currQ
            }
            if currQ != nil && values.contains(currQ!.val) {
                return currQ
            } 
            if currP != nil && values.contains(currP!.val) {
                return currP
            }
            if currQ != nil {
                values.insert(currQ!.val)   
            }
            if currP != nil {
                values.insert(currP!.val)   
            }
            currP = currP?.parent
            currQ = currQ?.parent
        }
        return nil
    }
}
/*
[3,5,1,6,2,0,8,null,null,7,4]
5
4
*/