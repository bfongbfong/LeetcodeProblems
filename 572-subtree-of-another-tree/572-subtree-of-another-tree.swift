/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard let s = s, let t = t else { return false }
        if s.val == t.val {
            return isSameTree(s, t) || isSubtree(s.left, t) || isSubtree(s.right, t)
        } else {
            return isSubtree(s.left, t) || isSubtree(s.right, t)
        }
    }

    func isSameTree(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
        if l == nil, r == nil { return true }
        guard let l = l, let r = r else { return false }
        if l.val == r.val {
            return isSameTree(l.left, r.left) && isSameTree(l.right, r.right)
        } else {
            return false
        }
    }
}