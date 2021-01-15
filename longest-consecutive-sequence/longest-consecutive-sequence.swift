class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var answer = 1
        if nums.isEmpty { return 0 }
        var set = Set<Int>()
        
        for num in nums {
            set.insert(num)
        }
        
        for num in set {
            if !set.contains(num - 1) {
                
                var currStreak = 1
                var currNum = num
                
                while set.contains(currNum + 1) {
                    currStreak += 1
                    currNum += 1
                }
                
                answer = max(answer, currStreak)
            }
        }
        
        return answer
    }
}
