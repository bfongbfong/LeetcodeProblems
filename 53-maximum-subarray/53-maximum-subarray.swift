class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        var answer = Int.min
        var mostRecentTail = nums[0]
        for i in 0..<nums.count {
            if i != 0 {
                mostRecentTail = max(nums[i], mostRecentTail + nums[i])
            }
            answer = max(answer, mostRecentTail)
        }
        return answer
    }
}