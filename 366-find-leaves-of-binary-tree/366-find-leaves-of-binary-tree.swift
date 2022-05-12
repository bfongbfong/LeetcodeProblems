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
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        func getHeight(_ root: TreeNode?) -> Int {
            guard let root = root else { return -1 }
            let leftHeight = getHeight(root.left)
            let rightHeight = getHeight(root.right)
            let thisHeight = max(leftHeight + 1, rightHeight + 1)
            if result.count == thisHeight {
                result.append([root.val])
            } else {
                result[thisHeight].append(root.val)
            }
            return thisHeight
         }
        
        _ = getHeight(root)
        return result
    }
}