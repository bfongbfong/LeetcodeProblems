class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.isEmpty || text2.isEmpty { return 0 }
        var text1 = Array(text1)
        var text2 = Array(text2)
        /*
        abec
        brec

        
        fbcde
        ace
        */
        var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        for row in stride(from: text1.count - 1, through: 0, by: -1) {
            for col in stride(from: text2.count - 1, through: 0, by: -1) {
                if text1[row] == text2[col] {
                    dp[row][col] = dp[row + 1][col + 1] + 1
                } else {
                    dp[row][col] = max(dp[row + 1][col], dp[row][col + 1])
                }
            }
        }

        return dp[0][0]
    }
}