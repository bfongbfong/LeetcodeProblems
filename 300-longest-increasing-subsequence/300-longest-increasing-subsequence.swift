class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        var answer = 1
        for i in 0..<nums.count {
            // if one back is less than n,
            if i == 0 { continue }
            var index = i
            var maxSub = 0
            while index - 1 >= 0 {
                if nums[index - 1] < nums[i] {
                    maxSub = max(maxSub, dp[index - 1])
                } 
                index -= 1
            }
            dp[i] = (maxSub + 1)
            answer = max(answer, dp[i])
            print(nums[i], dp[i])
        }
        return answer
    }
}