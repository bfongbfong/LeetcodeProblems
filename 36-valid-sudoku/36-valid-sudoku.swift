class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var sectionSets = Array(
            repeating: Array(
                repeating: Set<Character>(), 
                count: 9
            ),
            count: 9
        )
        var columnSets = Array(repeating: Set<Character>(), count: 9)
        for row in 0..<board.count {
            var rowSet = Set<Character>()
            for col in 0..<board[row].count {
                if board[row][col] == "." { continue }
                // check rows
                if rowSet.contains(board[row][col]) {
                    return false
                } else {
                    rowSet.insert(board[row][col])
                }

                // check columns
                if columnSets[col].contains(board[row][col]) {
                    return false
                } else {
                    columnSets[col].insert(board[row][col])
                }

                // check triads
                let sectionRow = row / 3
                let sectionCol = col / 3
                if sectionSets[sectionRow][sectionCol].contains(board[row][col]) {
                    return false
                } else {
                    sectionSets[sectionRow][sectionCol].insert(board[row][col])
                }
            }
        }
        return true
    }
}