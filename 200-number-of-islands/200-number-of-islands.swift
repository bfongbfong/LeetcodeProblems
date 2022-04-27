class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var answer = 0
        func dfs(_ row: Int, _ col: Int) {
            guard grid[row][col] == "1" else { return }
            grid[row][col] = "0"

            // up
            if row - 1 >= 0 {
                dfs(row - 1, col)   
            }

            // left 
            if col - 1 >= 0 {
                dfs(row, col - 1)
            }

            // right
            if col + 1 < grid[0].count {
                dfs(row, col + 1)
            }

            // down
            if row + 1 < grid.count {
                dfs(row + 1, col)   
            }
        }

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == "1" {
                    answer += 1
                    dfs(row, col)
                }
            }
        }
        return answer
    }
}