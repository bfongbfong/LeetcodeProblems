class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        // i think this is a sliding window problem.
        
        var maxIncreasingSub = 0
        
        // index, lengthOfLIS for that index
        var dp = Array(repeating: 1, count: nums.count)
​
        for rightI in 0..<nums.count {
            var maxAtRightI = 1
            for leftI in 0...rightI {
                if leftI == rightI { 
                    maxIncreasingSub = max(maxIncreasingSub, dp[rightI])
                    continue 
                }
                
                if nums[rightI] > nums[leftI] {
                    // print("rightI: \(rightI), leftI: \(leftI), adding \(dp[leftI]) to \(dp[rightI])")
                    maxAtRightI = max(maxAtRightI, dp[rightI] + dp[leftI])
                    // print("\(nums[rightI]) = \(maxAtRightI)")
                }
            }
            dp[rightI] = maxAtRightI
            maxIncreasingSub = max(maxIncreasingSub, dp[rightI])
        }
        
        return maxIncreasingSub
    }
}
