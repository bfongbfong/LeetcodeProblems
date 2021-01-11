class Solution {    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        
        let chars1 = Array(text1)
        let chars2 = Array(text2)
        
        for i in 1...chars1.count {
            for j in 1...chars2.count {
                let char1 = chars1[i - 1]
                let char2 = chars2[j - 1]
                
                if char1 == char2 {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        return dp[chars1.count][chars2.count]
    }
}
