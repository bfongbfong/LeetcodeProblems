class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s = Array(s)
        let wordDict = Set(wordDict)
        var memo: [Bool?] = Array(repeating: nil, count: s.count)

        func helper(_ leftI: Int) -> Bool {
            guard memo[leftI] == nil else { return memo[leftI]! }
            for rightI in leftI..<s.count {
                let curr = Array(s[leftI...rightI])
                if wordDict.contains(String(curr)) {
                    if rightI == s.count - 1 {
                        return true 
                    }
                    else if helper(rightI + 1) {
                        memo[leftI] = true
                        return true
                    }
                }
            }
            memo[leftI] = false
            return false
        }
        return helper(0)
    }
}