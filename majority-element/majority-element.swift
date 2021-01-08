class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var maxElement = -1
        var maxAmount = Int.min
        // key is the num, value is the amount of times it shows up
        var dict = [Int: Int]() 
        
        for num in nums {
            if dict[num] == nil {
                dict[num] = 1
            } else {
                dict[num]! += 1
            }
​
            if dict[num]! > maxAmount {
                maxAmount = dict[num]!
                maxElement = num
            }
            
            if maxAmount > nums.count / 2 {
                return maxElement
            }
        }
        return maxElement
    }
}
