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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, Int.min, Int.max)
    }

    func helper(_ root: TreeNode?, _ lowBound: Int, _ highBound: Int) -> Bool {
        guard let root = root else { return true }
        var leftIsValidBST = true
        if let left = root.left {
            leftIsValidBST = left.val < root.val && left.val > lowBound && helper(root.left, lowBound, root.val)
        }
        var rightIsValidBST = true
        if let right = root.right {
            rightIsValidBST = right.val > root.val && right.val < highBound && helper(root.right, root.val, highBound)
        }
        return leftIsValidBST && rightIsValidBST
    }
}