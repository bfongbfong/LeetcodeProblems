class Solution {
    func longestPalindrome(_ s: String) -> Int {
        let s = Array(s)
        var answer = 0
        var set = Set<Character>()
        for i in 0..<s.count {
            if set.contains(s[i]) {
                answer += 2
                set.remove(s[i])
            } else {
                set.insert(s[i])
            }
        }
        if !set.isEmpty {
            return answer + 1
        } else {
            return answer
        }
    }
}