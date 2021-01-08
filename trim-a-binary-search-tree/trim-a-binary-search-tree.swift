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
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        
        func helper(_ root: TreeNode?) -> TreeNode? {
            // if the root is less than lowest, keep going down right until you find nil or the low nuber itself 
​
            if root == nil { return nil }
            
//             else if root!.val == low {
//                 root!.left = nil
//                 root!.right = helper(root!.right)
//                 return root
//             } 
            
//             else if root!.val == high {
//                 root!.right = nil 
//                 root!.left = helper(root!.left)
//                 return root
//             }
​
            else if root!.val < low {
                // remove everythign left 
                root!.left = nil 
                return helper(root!.right)
            } 
            
            else if root!.val > high {
                // remove everything right 
                root!.right = nil
                return helper(root!.left)
            }
            
            else { // normal. between low and high
                root!.left = helper(root!.left)
                root!.right = helper(root!.right)
                return root
            }
​
            // if the root is greater than greatest, keep going down left until you find the cutoff point 
        }
        return helper(root)
    }
}
