class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
​
        var left = 0 
        var maxIncreasingSubSeqCount = 0
        var previous = Int.min
        
        for right in 0..<nums.count {
            if nums[right] <= previous {
                left = right
            } 
            maxIncreasingSubSeqCount = max(maxIncreasingSubSeqCount, right - left + 1)
            previous = nums[right]
        }
        
        return maxIncreasingSubSeqCount
    }
}
