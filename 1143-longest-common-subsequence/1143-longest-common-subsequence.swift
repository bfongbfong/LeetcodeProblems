class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.isEmpty || text2.isEmpty { return 0 }
        var text1 = Array(text1)
        var text2 = Array(text2)
        /*
        abc
        bcd 
        answer = bc
        
        fbcde
        ace
        */
        var memo = [[Int]: Int]()
        func helper(_ index1: Int, _ index2: Int) -> Int {
            guard memo[[index1, index2]] == nil else { return memo[[index1, index2]]! }
            if text1[index1] == text2[index2] {
                if index1 + 1 < text1.count && index2 + 1 < text2.count {
                    let answer = helper(index1 + 1, index2 + 1) + 1
                    memo[[index1, index2]] = answer
                   return answer
                } else {
                    return 1
                }
            } else {
                var one = 0
                var two = 0
                if index1 + 1 < text1.count {
                    one = helper(index1 + 1, index2)
                }
                if index2 + 1 < text2.count {
                    two = helper(index1, index2 + 1)
                }
                let answer = max(one, two)
                memo[[index1, index2]] = answer
                return answer
            }
        }

        return helper(0, 0)
    }
}