class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for letter in Array(s) {
            if let last = stack.last,
                ((last == "[" && letter == "]")
                || (last == "{" && letter == "}")
                || (last == "(" && letter == ")")) {
                    stack.removeLast()
            } else {
                stack.append(letter)
            }
        }
        return stack.isEmpty
    }
}