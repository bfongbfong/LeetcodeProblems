class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        /*
        1 2 3
        4 5 6
        */
        var memo = Array(repeating: Array(repeating: -1, count: grid[0].count), count: grid.count)
        func dfs(_ row: Int, _ col: Int) -> Int {
            if memo[row][col] != -1 { return memo[row][col] }
            if row == grid.count - 1 && col == grid[row].count - 1 {
                return grid[row][col]
            } 
            var down = Int.max
            if row + 1 < grid.count {
                down = dfs(row + 1, col)
            }
            var right = Int.max
            if col + 1 < grid[row].count {
                right = dfs(row, col + 1)
            }
            let answer = grid[row][col] + min(down, right)
            memo[row][col] = answer
            return answer
        }
        return dfs(0, 0)
    }
}