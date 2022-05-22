class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var answer = 0
        for i in 0..<nums.count {
            var currentSum = 0
            for j in i..<nums.count {
                currentSum += nums[j]
                if currentSum == k { 
                    answer += 1
                }
            }
        }
        return answer
    }
}