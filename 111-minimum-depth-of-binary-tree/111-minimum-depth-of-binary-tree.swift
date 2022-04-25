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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil {
            return minDepth(root.right) + 1
        }
        else if root.right == nil {
            return minDepth(root.left) + 1
        }
        
        let left = minDepth(root.left)
        let right = minDepth(root.right)
        return min(left, right) + 1
        // guard let root = root else { return 0 }
        // // do bfs 
        // // if a node has no children, stop and return 
        // var queue = [TreeNode]()
        // queue.append(root)
        // var depth = 0
        // while !queue.isEmpty {
        //     depth += 1
        //     for i in 0..<queue.count {
        //         let curr = queue[i]
        //         if curr.left == nil && curr.right == nil {
        //             return depth
        //         }
        //         if let left = curr.left {
        //             queue.append(left)
        //         }
        //         if let right = curr.right {
        //             queue.append(right)
        //         }
        //     }
        // }
        // return -1
    }
}