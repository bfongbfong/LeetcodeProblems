class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp = Array(repeating: Array(repeating: -1, count: grid[0].count), count: grid.count)
        for row in stride(from: grid.count - 1, through: 0, by: -1) {
            for col in stride(from: grid[row].count - 1, through: 0, by: -1) {
                if row == grid.count - 1 && col == grid[row].count - 1 {
                    dp[row][col] = grid[row][col]
                } else {
                    var right = Int.max
                    if col + 1 < grid[row].count {
                        right = dp[row][col + 1]
                    }
                    var down = Int.max
                    if row + 1 < grid.count {
                        down = dp[row + 1][col]
                    }
                    dp[row][col] = grid[row][col] + min(right, down)
                }
            }
        }
        return dp[0][0]
    }
}