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
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        /*
        every right sibling will become a left child
        */
        var newRoot: TreeNode?
        func helper(_ root: TreeNode?) {
            guard let root = root else { return }
            helper(root.left)
            if root.left == nil && root.right == nil {
                newRoot = root
            } else {
                root.left?.left = root.right
                root.left?.right = root   
                root.left = nil
                root.right = nil
            }
        }
        helper(root)
        return newRoot
    }
}