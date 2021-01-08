class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.isEmpty { return }
        var temp = 0
        
        for i in 0..<k {
            var outerTemp = nums[nums.count - 1]
            var innerTemp = nums[0]
            for j in 0..<nums.count {
                innerTemp = nums[j]
                nums[j] = outerTemp
                outerTemp = innerTemp
            }
        }
    }
}
