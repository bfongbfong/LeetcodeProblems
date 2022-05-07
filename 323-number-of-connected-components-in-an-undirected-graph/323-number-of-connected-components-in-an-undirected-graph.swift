class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        /*
        2 - 3
            1
        */
        var dict = [Int: [Int]]()
        for edge in edges {
            if dict[edge[0]] == nil {
                dict[edge[0]] = [edge[1]]
            } else {
                dict[edge[0]]!.append(edge[1])
            }
            if dict[edge[1]] == nil {
                dict[edge[1]] = [edge[0]]
            } else {
                dict[edge[1]]!.append(edge[0])
            }
        }

        var processed = Set<Int>()
        func dfs(_ num: Int, _ prev: Int? = nil) {
            if processed.contains(num) { return }
            processed.insert(num)
            if let neighbors = dict[num] {
                for neighbor in neighbors {
                    if prev != neighbor {
                        dfs(neighbor, prev)
                    }
                }
            }
        }

        var answer = 0
        for edge in edges {
            if !processed.contains(edge[0]) {
                answer += 1
                dfs(edge[0])
            }
        }

        return answer + n - processed.count
    }
}