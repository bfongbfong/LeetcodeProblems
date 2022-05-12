class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        var board = board
        func dfs(_ row: Int, _ col: Int) {
            guard board[row][col] == "X" else { return }
            board[row][col] = "."

            // up
            if row - 1 >= 0 {
                dfs(row - 1, col)
            }
            // right
            if col + 1 < board[0].count {
                dfs(row, col + 1)
            }
            // down
            if row + 1 < board.count {
                dfs(row + 1, col)
            }
            // left
            if col - 1 >= 0 {
                dfs(row, col - 1)
            }
        }

        var count = 0
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == "X" {
                    count += 1
                    dfs(row, col)
                }
            }
        }
        return count
    }
}