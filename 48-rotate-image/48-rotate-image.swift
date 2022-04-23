class Solution {
    // switch the row and col. and adjust the col
    // everythign in the first row, goes to the last column
    // everything in the second row, goest o the second to last column
    // everything in the third ro, goes to the second column
    // everything in the fourth row, goes to the first column

    // 0 1 2 3 4 5 6 7 8 9
    //   ^.                ^
    // this is just to get the reversed number
    func rotate(_ matrix: inout [[Int]]) {
        var originalValues = [[Int]: Int]()
        func helper(_ row: Int, _ col: Int) {
            var value = matrix[row][col]
            if let originalValue = originalValues[[row, col]] {
                // move this original value
                value = originalValue
            } else {
                originalValues[[row, col]] = value
            }

            var i = 0
            var reversedI = 0
            for backwardsI in stride(from: matrix.count - 1, through: 0, by: -1) {
                if i == row {
                    reversedI = backwardsI
                    break
                }
                i += 1
            }
            originalValues[[col, reversedI]] = matrix[col][reversedI]
            matrix[col][reversedI] = value
        }
        for row in 0..<matrix.count {
            for col in 0..<matrix[row].count {
                helper(row, col)
            }
        }
    }
}