class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var correctNums = Set(Array(0...nums.count))
        for num in nums {
            correctNums.remove(num)
        }
        return correctNums.first ?? -1
    }
}