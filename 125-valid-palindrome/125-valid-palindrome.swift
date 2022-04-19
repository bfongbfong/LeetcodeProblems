class Solution {
    func isPalindrome(_ s: String) -> Bool {
        // split it in half. turn both into dictionaries, compare them
        var punctuations: Set<Character> = [",", ".", ":", ";", "'", ")", "(", "!", "?", "-", " ", "@", "#", "_", "$", "%", "^", "&", "*", "{", "}", "[", "]", "\\", "\"", "`"]
        let s = s.lowercased().filter { !punctuations.contains($0) } 
        let halfwayIndex = s.count / 2 
        let chars = Array(s)
        // wait until the right index reaches the halfway mark
        var rightI = chars.count - 1
        var leftI = 0
        while leftI <= rightI {
            if chars[leftI] != chars[rightI] {
                return false
            }
            rightI -= 1
            leftI += 1
        }
        return true
    }
}