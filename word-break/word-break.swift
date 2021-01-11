class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if s.isEmpty { return false }
        
        var dp = Array(repeating: false, count: s.count + 1)
        // make a dp table with an extra spot before hand
        let chars = Array(s)
        
        dp[0] = true
        
        
        for i in 1...chars.count {
            for j in 0..<i {
                if wordDict.contains(String(Array(chars[j..<i]))) {
                    if dp[j] { // the last spot of the last found word
                        dp[i] = true
                        break
                    }
                }
            }    
        }
        
        return dp[chars.count]
    }
}
