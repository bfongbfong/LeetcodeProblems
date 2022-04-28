class Solution {
    // 6 7 8 9 10 11 12 1 2 3 4
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        let pivotIndex = findMin(nums)
        if target == nums[pivotIndex] {
            return pivotIndex
        }
        if pivotIndex == 0 || target < nums[0] {
            // target is on the right of the pivot index
            left = pivotIndex + 1
        } else {
            // target is on the left of the pivot index
            right = pivotIndex - 1
        }
        while left <= right {
            let mid = left + ((right - left) / 2)
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                // go left
                right = mid - 1
            } else {
                // go right
                left = mid + 1
            }
        }
        return -1
    }

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
                return mid + 1
            } else if mid - 1 >= 0 && nums[mid - 1] > nums[mid] {
                return mid
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
        return 0
    }
}