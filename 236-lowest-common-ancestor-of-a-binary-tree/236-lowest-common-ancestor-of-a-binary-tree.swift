/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var answer: TreeNode? = TreeNode(0)
        func hasOne(_ root: TreeNode?) -> Bool {
            guard let root = root else { return false }
            let leftHasOne = hasOne(root.left)
            let rightHasOne = hasOne(root.right)
            var rootIsOne = false
            if root === p || root === q { 
                rootIsOne = true
            }
            if (leftHasOne && rightHasOne) || (rootIsOne && (leftHasOne || rightHasOne)) {
                answer = root
                return true
            }
            return leftHasOne || rightHasOne || rootIsOne
        }

        _ = hasOne(root)
        return answer
    }
}