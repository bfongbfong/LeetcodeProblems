class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var rows = 0
        var n = n
        var currentRow = 1
        while n >= 0 {
            if n - currentRow < 0 {
                return rows
            } else {
                n -= currentRow
                currentRow += 1
                rows += 1
            }
        }
        return rows
    }
}