/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        if node == nil { return nil }
        var map = [Node?: Node]()
        func dfs(_ node: Node?) -> Node? {
            var copy = Node(node!.val)
            map[node] = copy
            for neighbor in node!.neighbors {
                if let neighborCopy = map[neighbor] {
                    copy.neighbors.append(neighborCopy)
                } else {
                    copy.neighbors.append(dfs(neighbor))
                }
            }
            return copy
        }
        return dfs(node)
    }
}