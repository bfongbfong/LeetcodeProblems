class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        var pairs: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["]
        
        for char in s {
            if let last = stack.last {
                if last == pairs[char] {
                    stack.removeLast()
                    continue
                }
            }
            stack.append(char)
        }
        
        return stack.isEmpty
    }
}
