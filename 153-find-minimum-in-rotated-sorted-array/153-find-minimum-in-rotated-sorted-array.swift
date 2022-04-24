class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            /* 
            observations:
            - if we look at the most left and most right numbers, if most right is lower than most left, than the inversion is inside our window
            */
            let mid = left + ((right - left) / 2)
            // check if we found the point
            if mid + 1 < nums.count && nums[mid + 1] < nums[mid] {
                return nums[mid + 1]
            } else if mid - 1 >= 0 && nums[mid - 1] > nums[mid] {
                return nums[mid]
            }
            // if we haven't found the point, move
            if nums[mid] > nums[left] {
                // go right
                left = mid + 1
            } else {
                // go left
                right = mid - 1
            }
        }
        return nums[0]
    }
}