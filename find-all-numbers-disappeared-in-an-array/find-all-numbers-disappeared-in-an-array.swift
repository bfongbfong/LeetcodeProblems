class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var numsSet = Set<Int>()
        for num in nums {
            numsSet.insert(num)
        }
        
        var returnArray = [Int]()
        for i in 0...nums.count {
            if i == 0 { continue }
            if !numsSet.contains(i) {
                returnArray.append(i)
            }
        }
        
        return returnArray
    }
}
