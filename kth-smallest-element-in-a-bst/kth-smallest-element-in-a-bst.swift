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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        // find smallest in the tree.
        // if k is still greater than 1, remove the smallest and start over
        var myK = k
                
        func inOrderTraversal(_ root: TreeNode?) -> Int? {
            if let left = root?.left {
                if let answer = inOrderTraversal(left) {
                    return answer
                }
            }
​
            if myK == 1 {
                // i've found the number.
                return root!.val
            } else {
                myK -= 1
            }
​
            if let right = root?.right {
                if let answer = inOrderTraversal(right) {
                    return answer
                }
            }
            
            return nil
        }
        
        if let answer = inOrderTraversal(root) {
            return answer
        } else {
            return -1
        }
    }
}
