class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.isEmpty && n == 1 { return true }
        if edges.isEmpty { return false }
        /* 
        basically i'm detecing if there's a loop in my graph right? or if there are pieces that are unconnected
        */
        var dict = [Int: [Int]]()
        for edge in edges {
            if dict[edge[0]] != nil {
                dict[edge[0]]!.append(edge[1])
            } else {
                dict[edge[0]] = [edge[1]]
            }
            if dict[edge[1]] != nil {
                dict[edge[1]]!.append(edge[0])
            } else {
                dict[edge[1]] = [edge[0]]
            }
        }

        var processed = Set<Int>()
        // goes through the nodes and processes them
        func dfs(_ node: Int, _ prev: Int? = nil) -> Bool {
            if processed.contains(node) { return false } // there was a loop
            print(node)
            processed.insert(node)
            if let neighbors = dict[node] {
                for neighbor in neighbors {
                    if neighbor != prev {
                        if dfs(neighbor, node) == false {
                            return false
                        }
                    }
                }
            }
            return true
        }

        if dfs(edges[0][0]) == false { 
            return false
        }

        return processed.count == n
    }
}