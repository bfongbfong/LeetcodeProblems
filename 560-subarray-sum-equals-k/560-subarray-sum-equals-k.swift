class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSums = [0: 1]
        var answer = 0
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
            let leftover = sum - k
            answer += prefixSums[leftover] ?? 0
            if prefixSums[sum] == nil {
                prefixSums[sum] = 1
            } else {
                prefixSums[sum]! += 1
            }
        }
        return answer
    }
}