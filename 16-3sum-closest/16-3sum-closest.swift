class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        /* 
        -4, -1 , 2 , 1
        */
        var nums = nums.sorted()
        var closest = 0
        var smallestDifference = Int.max
        for i in 0..<nums.count {
            if i == nums.count - 2 {
                break
            }
            var left = i + 1
            var right = nums.count - 1 
            while left < right {
                var sum = nums[i] + nums[left] + nums[right]
                let diff = abs(target - sum)
                if diff < smallestDifference {
                    smallestDifference = diff
                    closest = sum
                }

                if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return closest
    }
}