class Solution {
    func rob1(_ nums: [Int]) -> Int {
        var oneBack = 0
        var twoBack = 0
        for n in nums {
            let temp = max(n + twoBack, oneBack)
            twoBack = oneBack
            oneBack = temp
        }
        return oneBack   
    }

    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums[0] }
        let array1 = Array(nums[0...nums.count - 2])
        let array2 = Array(nums[1...nums.count - 1])
            return max(rob1(array1), rob1(array2))
    }
}