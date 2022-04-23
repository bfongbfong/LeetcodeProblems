class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        // to optimize, make the search able to go backwards
        let word = Array(word)
        func dfs(_ row: Int, _ col: Int, targetLetterIndex: Int, marked: Set<[Int]>, up: Bool = false, right: Bool = false, down: Bool = false, left: Bool = false) -> Bool {
            guard board[row][col] == word[targetLetterIndex] else { return false }
            guard !marked.contains([row, col]) else { return false }
            if targetLetterIndex == word.count - 1 { return true }
            // up
            if row - 1 >= 0 && up {
                var marked = marked
                marked.insert([row, col])
                if dfs(row - 1, col, targetLetterIndex: targetLetterIndex + 1, marked: marked, up: true, right: true, left: true) {
                    return true
                }
            }

            // right
            if col + 1 < board[0].count && right {
                var marked = marked
                marked.insert([row, col])
                if dfs(row, col + 1, targetLetterIndex: targetLetterIndex + 1, marked: marked, up: true, right: true, down: true) {
                    return true
                }
            }

            // down
            if row + 1 < board.count && down {
                var marked = marked
                marked.insert([row, col])
                if dfs(row + 1, col, targetLetterIndex: targetLetterIndex + 1, marked: marked, right: true, down: true, left: true) {
                    return true
                }
            }

            // left
            if col - 1 >= 0 && left {
                var marked = marked
                marked.insert([row, col])
                if dfs(row, col - 1, targetLetterIndex: targetLetterIndex + 1, marked: marked, up: true, down: true, left: true) {
                    return true
                }
            }
            return false
        }
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                var marked = Set<[Int]>()
                if dfs(row, col, targetLetterIndex: 0, marked: marked, up: true, right: true, down: true, left: true) {
                    return true
                }
            }
        }
        return false
    }
}