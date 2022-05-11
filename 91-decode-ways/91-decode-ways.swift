class Solution {
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)

        var dp = [s.count: 1]
        func helper(_ i: Int) -> Int {
            if let val = dp[i] {
                return val
            }

            if s[i] == "0" {
                return 0
            }
            var result = helper(i + 1)
            if i + 1 < s.count && Int(String(s[i]) + String(s[i + 1]))! <= 26 {
                result += helper(i + 2)
            }
            dp[i] = result
            return result
        }
        return helper(0)
    }
}