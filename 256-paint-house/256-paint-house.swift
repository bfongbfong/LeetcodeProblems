class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        /* red blue gree
        0  17   2.   17
        1  16.  16.  5
        2  14.  3.   19
        */

        var memo = Array(repeating: Array(repeating: -1, count: costs[0].count), count: costs.count)
        func helper(_ row: Int, _ prevColor: Int) -> Int {
            var answer = Int.max
            for color in 0..<costs[row].count {
                if color == prevColor { continue }
                if row + 1 < costs.count {
                    if memo[row + 1][color] != -1 { 
                        answer = min(answer, memo[row + 1][color] + costs[row][color])
                    } else {
                        let next = helper(row + 1, color)
                        memo[row + 1][color] = next
                        answer = min(answer, next + costs[row][color])
                    }
                } else {
                    answer = min(answer, costs[row][color])
                }
            }
            return answer
        }
        return helper(0, -1)
    }
}