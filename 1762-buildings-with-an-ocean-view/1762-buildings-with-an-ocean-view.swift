class Solution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        // dp represents the highest tower to the right of it
        var dp = Array(repeating: 0, count: heights.count)
        dp[heights.count - 1] = heights[heights.count - 1]
        var answer = [heights.count - 1]
        for i in stride(from: heights.count - 2, through: 0, by: -1) {
            if dp[i + 1] < heights[i] {
                answer.insert(i, at: 0)
                dp[i] = heights[i]
            } else {
                dp[i] = dp[i + 1]
            }
        }
        return answer
    }
}