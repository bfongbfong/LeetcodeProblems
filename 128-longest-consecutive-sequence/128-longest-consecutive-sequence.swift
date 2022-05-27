class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            set.insert(num)
        }

        func consecutiveLength(_ num: Int) -> Int {
            if set.contains(num) {
                set.remove(num)
                return 1 + consecutiveLength(num + 1) + consecutiveLength(num - 1)
            } else {
                return 0
            }
        }

        var answer = 0 
        for num in set {
            answer = max(answer, consecutiveLength(num))
        }
        return answer
    }
}