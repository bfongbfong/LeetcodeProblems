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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        // find the smallest, then go back up?
        let inorderArray = getInOrder(root)
        if inorderArray.count > k - 1 && k - 1 >= 0 {
            return inorderArray[k - 1]   
        } else {
            return 0
        }
    }

    func getInOrder(_ root: TreeNode?) -> [Int] {
        var answer = [Int]()
        func inorder(_ root: TreeNode?) {
            guard let root = root else { return }
            inorder(root.left)
            answer.append(root.val)
            inorder(root.right)
        }
        inorder(root)
        return answer
    }
}