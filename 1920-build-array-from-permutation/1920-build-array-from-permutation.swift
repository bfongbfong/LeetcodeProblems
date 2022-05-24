class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            answer[i] = nums[nums[i]]
        }
        return answer
    }
}