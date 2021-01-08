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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        // find mid point, set that point to head.
        // find left and right mid points, se those to left nad right children
        // recurse
        if nums.isEmpty { return nil }
        
        return helper(nums)
    }
    
    func helper(_ nums: [Int]) -> TreeNode? {
        let midPointIndex = nums.count / 2 
        let midPoint = nums[midPointIndex]
        
        let root = TreeNode(midPoint)
        if midPointIndex - 1 >= 0 {
            root.left = helper(Array(nums[0...midPointIndex - 1]))   
        }
        if midPointIndex + 1 < nums.count {
            root.right = helper(Array(nums[midPointIndex + 1..<nums.count]))   
        }
        return root
    }
}
