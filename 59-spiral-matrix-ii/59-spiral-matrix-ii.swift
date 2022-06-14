class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        /*
        4
        1 2  3 4 
               5
               6
        10 9 8 7*/
        var grid = Array(repeating: Array(repeating: -1, count: n), count: n)
        func helper(_ row: Int, _ col: Int, _ num: Int) {
            grid[row][col] = num
            let canGoRight = col + 1 < n && grid[row][col + 1] == -1
            let canGoDown = row + 1 < n && grid[row + 1][col] == -1
            let canGoLeft = col - 1 >= 0 && grid[row][col - 1] == -1
            let canGoUp = row - 1 >= 0 && grid[row - 1][col] == -1
            // can go right and down 
            if canGoRight && canGoDown {
                // go right
                helper(row, col + 1, num + 1)
            }
            // if can go left and down 
            else if canGoLeft && canGoDown {
                // go down
                helper(row + 1, col, num + 1)
            }
            // if can go left and up
            else if canGoLeft && canGoUp {
                // go left
                helper(row, col - 1, num + 1)
            }
            // if can go up and right
            else if canGoUp && canGoRight {
                // gp up
                helper(row - 1, col, num + 1)
            }
            else if canGoDown {
                helper(row + 1, col, num + 1)
            }
            else if canGoLeft {
                helper(row, col - 1, num + 1)
            }
            else if canGoUp {
                helper(row - 1, col, num + 1)
            }
            else if canGoRight {
                helper(row, col + 1, num + 1)
            } 
        }
        helper(0, 0, 1)
        return grid
    }
}