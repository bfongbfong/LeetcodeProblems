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

class Codec {
    /*
    1, 2, N, N, 3, 4, N, N, 5, N, N
    */
    func serialize(_ root: TreeNode?) -> String {
        var result = ""
        func inOrder(_ root: TreeNode?) {
            guard let root = root else {
                result += "N,"
                return
            }
            result += String(root.val) + ","
            inOrder(root.left)
            inOrder(root.right)
        }
        inOrder(root)
        print(result)
        result.removeLast()
        return result
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var data = data.components(separatedBy: ",")
        // var data = Array(data)
        var current: TreeNode?
        func helper(_ parent: TreeNode?) {
            guard !data.isEmpty else { return }
            if parent == nil {
                let first = data.removeFirst()
                if first == "N" {
                    return
                } else {
                    current = TreeNode(Int(String(first))!)
                    var root = parent
                    root = current
                    helper(root)
                }
            } else {
                let first = data.removeFirst()
                if first == "N" {
                    if !data.isEmpty {
                        let second = data.removeFirst()
                        if second == "N" {
                            return 
                        } else {
                            var root = parent
                            root?.right = TreeNode(
                                Int(
                                    String(second)
                                )!
                            )
                            helper(root?.right)
                        }
                    } else {
                        return
                    }
                } else {
                    var root = parent
                    root?.left = TreeNode(Int(String(first))!)
                    helper(root?.left)
                    if !data.isEmpty {
                        let second = data.removeFirst()
                        if second != "N" {
                            root?.right = TreeNode(Int(String(second))!)
                            helper(root?.right)
                        }
                    }
                }
            }
        }
        helper(nil)
        return current
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))