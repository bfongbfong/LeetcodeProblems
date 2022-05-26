class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            if dict[nums[i]] == nil {
                dict[nums[i]] = 1
            } else {
                dict[nums[i]]! += 1
            }
        }
        
        var array = [(Int, Int)]()
        for (key, val) in dict {
            array.append((key, val))
        }

        array.sort(by: { $0.1 > $1.1 })
        let answerArray = array.map { (key, val) in return key }
        return Array(answerArray[0..<k])
    }
}