class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        /*
        iterate through and build an adjacency list
        and then traverse the list to see the longest uninterrupted path
        100: []
        4: 3
        200: []
        1: 2
        3: 2
        2: 1, 3
        [[1], [1, 2], [6, 8], ]
        0
        */
        var set = Set<Int>()
        for num in nums {
            set.insert(num)
        }

        var processed = Set<Int>()
        func helper(_ num: Int, _ prev: Int? = nil) -> Int {
            processed.insert(num)
            var answer = 1
            if set.contains(num + 1) && num + 1 != prev {
                answer += helper(num + 1, num)
            }
            if set.contains(num - 1) && num - 1 != prev {
                answer += helper(num - 1, num)
            }
            return answer
        }

        var answer = 0
        for num in nums {
            if !processed.contains(num) {
                answer = max(answer, helper(num))
            }
        }
        return answer
    }
}