class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: n), count: m)
        func dfs(_ row: Int, _ col: Int) -> Int {
            if memo[row][col] != nil { return memo[row][col]! }
            var result = 0
            if row == m - 1 && col == n - 1 {
                return 1
            }
            if row + 1 < m {
                result += dfs(row + 1, col)
            }
            if col + 1 < n {
                result += dfs(row, col + 1)
            }
            memo[row][col] = result
            return result
        }
        return dfs(0, 0)
    }
}