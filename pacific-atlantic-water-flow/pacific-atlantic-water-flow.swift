class Solution {
    
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        if matrix.isEmpty { return [] }
        
        var indexes = [[Int]]()
        
        var pacific: [[Bool]] = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
        var atlantic: [[Bool]] = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
​
        for row in 0..<matrix.count {
            for col in 0..<matrix[0].count {
                if (row == 0 || col == 0) {
                    dfs(row, col, Int.min, matrix, &pacific)
                } 
                if row == matrix.count - 1 || col == matrix[0].count - 1 {
                    dfs(row, col, Int.min, matrix, &atlantic)
                }
            }
        }
        
        
        for row in 0..<matrix.count {
            for col in 0..<matrix[0].count {
                if pacific[row][col] && atlantic[row][col] {
                    indexes.append([row, col])
                }
            }
        }
        
        return indexes
    }
    
    // mutates the ocean passed in
    private func dfs(_ row: Int, _ col: Int, _ prevVal: Int, _ matrix: [[Int]], _ ocean: inout [[Bool]]) {
        if row < 0 || col >= matrix[0].count || row >= matrix.count || col < 0 {
            return
        } else if prevVal > matrix[row][col] {
            return
        } else if ocean[row][col] == true {
            return
        }
        
        ocean[row][col] = true
        
        dfs(row + 1, col, matrix[row][col], matrix, &ocean)
        dfs(row - 1, col, matrix[row][col], matrix, &ocean)
        dfs(row, col + 1, matrix[row][col], matrix, &ocean)
        dfs(row, col - 1, matrix[row][col], matrix, &ocean)
    }
}
