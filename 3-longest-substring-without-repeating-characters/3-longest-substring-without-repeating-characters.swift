class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // sliding window problem
        var leftI = 0
        var rightI = 0
        let chars = Array(s)
        var letterStore = [Character: Int]()
        var answer = 0
        while rightI < chars.count {
            if let indexOfLetter = letterStore[chars[rightI]] {
                // reset window
                while leftI != indexOfLetter + 1 {
                    letterStore[chars[leftI]] = nil
                    leftI += 1
                }
                // leftI = indexOfLetter + 1
                letterStore[chars[rightI]] = rightI
            } else {
                letterStore[chars[rightI]] = rightI
            }

            answer = max(answer, rightI - leftI + 1)
            rightI += 1
        }
        return answer
    }
}