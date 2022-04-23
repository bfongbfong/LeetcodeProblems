class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashTable = [Int: Int]()
        for i in 0..<nums.count {
            let compliment = target - nums[i]
            if let complimentIndex = hashTable[compliment] {
                return [complimentIndex, i]
            }
            hashTable[nums[i]] = i
        }
        return []
    }
}