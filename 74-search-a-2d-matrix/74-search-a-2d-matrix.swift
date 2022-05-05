class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        // 2, 1
        // 2 * 4 = 8 + 1 = 9
        // 9 / 4 = 2 is row
        // 9 % 4 = 1 is col
        // 1, 2
        // 1 * 4 = 4 + 2= 6
        // multiply row by matrix[0].count and then add the col to get it's flat position
        // take the flat position, divide by matrix[0].count to get row, % by matrix[0].count to get col
        var left = 0
        var right = (matrix.count * matrix[0].count) - 1
        while left <= right {
            let mid = left + ((right - left) / 2)
            let row = mid / matrix[0].count
            let col = mid % matrix[0].count 
            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] > target {
                // go left
                right = mid - 1
            } else {
                // go right
                left = mid + 1
            }
        }
        return false
    }
}