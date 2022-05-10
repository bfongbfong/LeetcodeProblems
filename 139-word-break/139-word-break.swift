class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        /*
        aaaa aaa
              ^
        leetcode
           ^
        */
        let s = Array(s)
        let wordDict = Set(wordDict)
        var dp: [Bool] = Array(repeating: false, count: s.count + 1)
        dp[s.count] = true

        for leftI in stride(from: s.count - 1, through: 0, by: -1) {
            for rightI in leftI..<s.count {
                let curr = Array(s[leftI...rightI])
                print(curr)
                if wordDict.contains(String(curr)) {
                    dp[leftI] = dp[leftI + curr.count]
                    if dp[leftI] { break }
                }   
            }
        }
        return dp[0]
    }
}