class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int: Int]()
        var left = 0
        var right = 0
        while right < nums.count {
            if dict[nums[right]] != nil && dict[nums[right]]! > 0 {
                return true
            }
            if dict[nums[right]] == nil {
                dict[nums[right]] = 1
            } else {
                dict[nums[right]]! += 1
            }
            if right - left == k {
                dict[nums[left]]! -= 1
                left += 1
            } 
            right += 1
        }
        return false
    }
}