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
    /*
    -10 
   9   20
     15
    */
    func maxPathSum(_ root: TreeNode?) -> Int {
        var answer = Int.min
        // var memo = [TreeNode: Int]()
        func getMaxPath(_ root: TreeNode?) -> Int? {
            guard let root = root else { return nil }
            let left: Int?
            let right: Int?
            left = getMaxPath(root.left)
            right = getMaxPath(root.right)
            
            return max(max(left ?? 0, right ?? 0) + root.val, root.val)
        }

        func helper(_ root: TreeNode?) {
            guard let root = root else { return }
            let left = getMaxPath(root.left)
            let right = getMaxPath(root.right)
            let sum = (left ?? 0) + (right ?? 0) + root.val
            let values: [Int] = [(left ?? Int.min), (right ?? Int.min), sum, (left ?? 0) + root.val, (right ?? 0) + root.val, root.val]
            answer = max(answer, values.max()!)
            helper(root.left)
            helper(root.right)
        }
        helper(root)
        return answer
    }
}