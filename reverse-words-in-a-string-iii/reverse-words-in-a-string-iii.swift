class Solution {
    func reverseWords(_ s: String) -> String {
        var words = s.components(separatedBy: " ")
        for i in 0..<words.count {
            words[i] = reverseWord(words[i])
        }
        
        return words.joined(separator: " ")
    }
    
    
    
    private func reverseWord(_ s: String) -> String {
        let chars = Array(s)
        
        var returnChars = [Character]()
        for i in stride(from: chars.count - 1, through: 0, by: -1) {
            returnChars.append(chars[i])
        }
        return String(returnChars)
    }
}
