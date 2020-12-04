class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (currentIndex, num) in nums.enumerated() {
            let compliment = target - num
            if let complimentIndex = dict[compliment] {
                return [complimentIndex, currentIndex]
            } else {
                dict[num] = currentIndex
            }
        }
        return []
    }
}
