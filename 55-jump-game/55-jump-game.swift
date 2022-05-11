class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var dp = Array(repeating: false, count: nums.count)
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if i == nums.count - 1 {
                dp[i] = true
            } else {
                var result = false
                for jump in stride(from: nums[i], through: 1, by: -1) {
                    if i + jump < nums.count && dp[i + jump] {
                        result = true
                        break
                    }
                }
                dp[i] = result
            }
        }
        return dp[0]
    }
}