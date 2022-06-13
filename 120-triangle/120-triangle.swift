class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        /*
        0
        0 1 
        0 1 2 
        0 1 2 3 
       0 1 2 3 4 
        */
        var triangle = triangle
        for row in 0..<triangle.count {
            for col in 0..<triangle[row].count {
                if row == 0 {
                    continue
                }
                else if col == 0 {
                    triangle[row][col] += triangle[row - 1][col]
                }
                else if col == triangle[row].count - 1 {
                    triangle[row][col] += triangle[row - 1][col - 1]
                } else {
                    triangle[row][col] += min(triangle[row - 1][col], triangle[row - 1][col - 1])
                }
            }
        }

        return triangle[triangle.count - 1].min()!
    }
}