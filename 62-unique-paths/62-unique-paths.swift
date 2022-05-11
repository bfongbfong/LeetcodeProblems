class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        dp[m - 1][n - 1] = 1
        for row in stride(from: m - 1, through: 0, by: -1) {
            for col in stride(from: n - 1, through: 0, by: -1) {
                if row == m - 1 && col == n - 1 {
                    dp[row][col] = 1
                } else {
                    dp[row][col] = dp[row + 1][col] + dp[row][col + 1]
                }
            }
        }
        return dp[0][0]
    }
}