class Solution {
    func longestPalindrome(_ s: String) -> String {
        var answer = ""
        var count = 0
        let chars = Array(s)
        for i in 0..<chars.count {
            // odd length
            if true {
                var leftI = i
                var rightI = i
                while leftI >= 0 && rightI < chars.count && chars[leftI] == chars[rightI] {
                    if rightI - leftI + 1 > count {
                        count = rightI - leftI + 1
                        answer = String(Array(chars[leftI...rightI]))
                    }
                    leftI -= 1
                    rightI += 1
                }
            }

            // even length
            if true {
                var leftI = i
                var rightI = i + 1
                while leftI >= 0 && rightI < chars.count && chars[leftI] == chars[rightI] {
                    if rightI - leftI + 1 > count {
                        count = rightI - leftI + 1
                        answer = String(Array(chars[leftI...rightI]))
                    }
                    leftI -= 1
                    rightI += 1
                }
            }
        }
        return answer
    }
}