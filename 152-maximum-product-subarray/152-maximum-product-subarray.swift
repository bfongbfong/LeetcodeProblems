class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        // need to store the max absolute value at each point, or the highest and lowest
        var maxes = Array(repeating: 0, count: nums.count)
        var mins = Array(repeating: 0, count: nums.count)
        var prevMax = nums[0]
        var prevMin = nums[0]
        var answer = Int.min
        for i in 0..<nums.count {
            if i == 0 {
                maxes[i] = prevMax
                mins[i] = prevMin
            } else {
                maxes[i] = max(max(prevMax * nums[i], nums[i]), prevMin * nums[i])
                mins[i] = min(min(prevMin * nums[i], nums[i]), prevMax * nums[i])
                prevMax = maxes[i]
                prevMin = mins[i]
            }
            answer = max(answer, maxes[i])
        }
        return answer
    }
}