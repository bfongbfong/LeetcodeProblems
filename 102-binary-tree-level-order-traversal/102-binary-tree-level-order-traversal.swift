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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var answer = [[Int]]()
        var q = [TreeNode]()
        if let root = root {
            q.append(root)
        }
        while !q.isEmpty {
            var currentRow = [Int]()
            for i in 0..<q.count {
                let node = q.removeFirst()
                if let left = node.left {
                    q.append(left)
                }
                if let right = node.right {
                    q.append(right)
                }
                currentRow.append(node.val)
            }
            answer.append(currentRow)
        }
        return answer
    }
}