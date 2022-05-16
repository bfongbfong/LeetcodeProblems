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
            2
      2          5
 3         2    5.      7
3  100  101  2        7. 95
    
    if 2 has no nodes, then it's done
    once you get to 5, you know it could potentially be the second smallest.
    you check it's children. if it has no children, then that's the answer.
    however, if it has children, one of them will be five, and the other will be bigger.
    i think you have to follow the track of 2, it will have a bunch of branches that are larger than it
    just check every branch of 2 until you find the answer. you don't need to check beyond the branch

    */
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        var currentSecondLowest = Int.max
        func helper(_ root: TreeNode) {
            if root.left == nil && root.right == nil {
                return 
            }
            if root.left!.val < root.right!.val {
                helper(root.left!)
                if root.right!.val < currentSecondLowest {
                    currentSecondLowest = root.right!.val
                }
            } else if root.left!.val > root.right!.val {
                helper(root.right!)
                if root.left!.val < currentSecondLowest {
                    currentSecondLowest = root.left!.val
                }
            } else {
                helper(root.right!)
                helper(root.left!)
            }
        }
        if root == nil { return -1 }
        helper(root!)
        if currentSecondLowest == Int.max { return -1 }
        return currentSecondLowest
    }
}