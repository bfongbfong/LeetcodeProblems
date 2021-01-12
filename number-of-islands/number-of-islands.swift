class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
      var matrix = grid
  
      var total = 0
      for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
          // imagine this is the vehicle that drives us forward if nothing else moves us.
          if matrix[i][j] == "1" {
            total += 1
            dfs(i, j, &matrix)
          }
        }
      }
      return total
    }
​
    /// finds all other 1's connected to this island and turns them into 0's
    private func dfs(_ col: Int, _ row: Int, _ matrix: inout [[Character]]) {
​
      if matrix[col][row] == "0" {
        return
      } else {
        matrix[col][row] = "0"
      }
      // check left
      if col - 1 >= 0 {
        dfs(col - 1, row, &matrix)
      }
      // check up
      if row - 1 >= 0 {
        dfs(col, row - 1, &matrix)
      }
​
      // check right
      if col + 1 < matrix.count {
        dfs(col + 1, row, &matrix)
      }
​
      // check down 
      if !matrix.isEmpty && row + 1 < matrix[0].count {
        dfs(col, row + 1, &matrix)
      }
    }
}
