class Solution {
    func jump(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums.count)
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if i == nums.count - 1 {
                dp[i] = 0
            } else {
                var minJumps = Int.max
                for jump in 0...nums[i] {
                    if jump == 0 { continue }
                    if jump + i >= nums.count { continue }
                    if dp[jump + i] == 0 && jump + i != nums.count - 1 { continue }
                    minJumps = min(minJumps, dp[jump + i])
                }
                if minJumps == Int.max {
                    minJumps = 0
                } else {
                    dp[i] = minJumps + 1   
                }
                print(i, dp[i])
            }
        }
        return dp[0]
    }
}