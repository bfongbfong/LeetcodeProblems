class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        var left = 0
        var right = 1
        var answer = nums[0]
        var current = nums[0]
        while right < nums.count {
            if current < 0 {
                left = right
                current = nums[right]
            } else {
                current += nums[right]   
            }
            answer = max(answer, current)
            right += 1
        }
        return answer
    }
}