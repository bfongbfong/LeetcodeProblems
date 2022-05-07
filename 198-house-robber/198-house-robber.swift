class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 2 { return max(nums[0], nums[1]) }
        if nums.count < 2 { return nums[0] }
        /*
        1 100 1 100 1000000
        2 1 10 10 10
        two steps or three?
        */
        var second = nums[nums.count - 1]
        var first = nums[nums.count - 2]
        var third = 0
        // first num is with 2 steps, second is with 3 steps
        for i in stride(from: nums.count - 3, through: 0, by: -1) {
            let curr = max(second + nums[i], third + nums[i])
            third = second
            second = first
            first = curr
        }
        return max(first, second)
    }
}