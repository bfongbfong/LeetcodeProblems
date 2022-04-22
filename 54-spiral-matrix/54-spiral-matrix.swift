class Solution {
    /* 
    1  2. 3. 4
    5. 6  7. 8
    9. 10 11 12
    */
    enum Direction {
        case up, down, left, right
    }
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var processed = Set<[Int]>()
        var answer = [Int]()
        func spiral(_ row: Int, _ col: Int, direction: Direction) {
            answer.append(matrix[row][col])
            processed.insert([row, col])
            switch direction {
            case .right:
                if col + 1 < matrix[0].count && !processed.contains([row, col + 1]) {
                    spiral(row, col + 1, direction: .right)   
                } 
                // go down 
                else if row + 1 < matrix.count && !processed.contains([row + 1, col]) {
                    spiral(row + 1, col, direction: .down)
                }
            case .down:
                if row + 1 < matrix.count && !processed.contains([row + 1, col])  {
                    spiral(row + 1, col, direction: .down)   
                } 
                // go left 
                else if col - 1 >= 0 && !processed.contains([row, col - 1]){
                    spiral(row, col - 1, direction: .left)
                }
            case .left:
                if col - 1 >= 0 && !processed.contains([row, col - 1])  {
                    spiral(row, col - 1, direction: .left)
                }
                // go up 
                else if row - 1 >= 0 && !processed.contains([row - 1, col]) {
                    spiral(row - 1, col, direction: .up)
                }
            case .up:
                if row - 1 >= 0 && !processed.contains([row - 1, col])  {
                    spiral(row - 1, col, direction: .up)
                }
                // go right
                else if col + 1 < matrix[0].count && !processed.contains([row, col + 1]) {
                    spiral(row, col + 1, direction: .right)   
                }
            }
        }
        spiral(0, 0, direction: .right)
        return answer
    }
}