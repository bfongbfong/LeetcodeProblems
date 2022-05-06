class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1 
        while left <= right {
            let mid = left + ((right - left) / 2)
            if nums[mid] == target {
                // expand
                left = mid
                right = mid
                while nums[left] == nums[mid] && nums[right] == nums[mid] {
                    if left - 1 >= 0 && nums[left - 1] == nums[mid] {
                        left -= 1
                    }
                    else if right + 1 < nums.count && nums[right + 1] == nums[mid] {
                        right += 1
                    } else {
                        return [left, right]
                    }
                }
                return [-1, -1]
            } else if nums[mid] > target {
                // go left
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return [-1, -1]
    }
}