class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.isEmpty { return }
        var traversed = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
        
        for row in 0..<matrix.count {
            for col in 0..<matrix[0].count {
                if matrix[row][col] == 0 && !traversed[row][col] {
                    mark(row, col, &matrix, &traversed)
                }
            }
        }
    }
    
    private func mark(_ row: Int, _ col: Int, _ matrix: inout [[Int]], _ traversed: inout [[Bool]]) {
        
        // mark each element with same row or same col with 0 
        
        traversed[row][col] = true
        
        for r in 0..<matrix.count {
            for c in 0..<matrix[0].count {
                if (r == row || c == col) && !traversed[r][c] && matrix[r][c] != 0 {
                    traversed[r][c] = true
                    matrix[r][c] = 0
                }
            }
        }
        
    }
}
