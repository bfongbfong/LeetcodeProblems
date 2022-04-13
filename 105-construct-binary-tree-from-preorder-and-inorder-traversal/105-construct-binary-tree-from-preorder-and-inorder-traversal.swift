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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty { return nil }
        var head = TreeNode(preorder[0])
        guard let mid = inorder.index(of: preorder[0]) else { return nil }
        head.left = buildTree(Array(preorder[1..<mid + 1]), Array(inorder[0..<mid]))
        head.right = buildTree(Array(preorder[mid + 1..<preorder.count]), Array(inorder[mid + 1..<inorder.count]))
        return head
    }
}