class Solution {
    func validPalindrome(_ s: String) -> Bool {
        if s.isEmpty { return true }
        var s = Array(s)
        var deleted = false
        func helper(_ left: Int, _ right: Int) -> Bool {
            var left = left
            var right = right
            while left <= right {
                if s[left] == s[right] {
                    right -= 1
                    left += 1
                } else if !deleted {
                    deleted = true
                    // check which pointer to move.
                    return helper(left + 1, right) || helper(left, right - 1)
                } else {
                    return false
                }
            }
            return true
        }
        return helper(0, s.count - 1)
    }
}