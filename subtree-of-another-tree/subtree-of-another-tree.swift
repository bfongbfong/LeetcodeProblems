/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil {
            return false
        } else if isSameTree(s, t) {
            return true
        } else {
            return isSubtree(s!.left, t) || isSubtree(s!.right, t)
        }
    }
    
    func isSameTree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil { return true }
        if s == nil || t == nil {
            return false
        }
        
        return s!.val == t!.val && isSameTree(s?.left, t?.left) && isSameTree(s?.right, t?.right) 
    }
}
