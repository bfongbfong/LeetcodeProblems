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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var answer = 0
        func longestLeftAndRight(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let longestLeftPath = longestLeftAndRight(root.left)
            let longestRightPath = longestLeftAndRight(root.right)
            answer = max(answer, (longestLeftPath + longestRightPath))
            return max(longestLeftPath, longestRightPath) + 1
        }
        _ = longestLeftAndRight(root)
        return answer
    }
}