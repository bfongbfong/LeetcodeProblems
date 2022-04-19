class Solution {
    func countSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        for i in 0..<chars.count {
            var leftI = i
            var rightI = i
            while leftI >= 0 && rightI < chars.count && chars[leftI] == chars[rightI] {
                count += 1
                leftI -= 1
                rightI += 1
            }

            var left = i
            var right = i + 1
            while left >= 0 && right < chars.count && chars[left] == chars[right] {
                count += 1
                left -= 1
                right += 1
            }
        }
        return count
     }
}