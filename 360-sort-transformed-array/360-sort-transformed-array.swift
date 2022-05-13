class Solution {
    func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
        var nums = nums
        for i in 0..<nums.count {
            nums[i] = nums[i] * nums[i] * a + nums[i] * b + c
        }
        return nums.sorted()
    }
}