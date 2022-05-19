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
        /*
        i could keep an array for each downward traversal.
        if i reach one of the numbers, then i 
        eventually, I'll have both arrays. loop through both arrays backwards until i get to a different number. 
        */
        var pPath = [TreeNode]()
        var qPath = [TreeNode]()
        func helper(_ root: TreeNode?, _ path: [TreeNode]) {
            guard let root = root else { return }
            var path = path
            path.append(root)
            if root === q {
                qPath = path
                if !pPath.isEmpty {
                    return
                }
            } else if root === p {
                pPath = path
                if !qPath.isEmpty {
                    return
                }
            }

            helper(root.left, path)
            helper(root.right, path)
        }
        helper(root, [])
        var i = 0
        var lca: TreeNode?
        while i < pPath.count && i < qPath.count {
            if pPath[i] === qPath[i] {
                lca = pPath[i]
                i += 1
            } else {
                break
            }
        }
        return lca
    }
}