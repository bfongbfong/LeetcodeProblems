class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        /*
        aaaa aaa
              ^
        leetcode
           ^
        */
        let s = Array(s)
        var dp: [Bool] = Array(repeating: false, count: s.count + 1)
        dp[s.count] = true

        for i in stride(from: s.count - 1, through: 0, by: -1) {
            for word in wordDict {
                if s.count - i >= word.count && String(Array(s[i...i + word.count - 1])) == word {
                    dp[i] = dp[i + word.count]
                    if dp[i] { break }
                }
            }
        }
        return dp[0]
    }
}