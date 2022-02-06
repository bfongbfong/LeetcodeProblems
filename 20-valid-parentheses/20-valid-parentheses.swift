class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for letter in s {
            // ((()))
            if let last = stack.last, letter == compliment(last) {
                _ = stack.removeLast()
            } else {
                stack.append(letter)   
            }
        }
        return stack.isEmpty
    }

    func compliment(_ char: Character) -> Character {
        switch char {
        case "(":
            return ")"
        case "[":
            return "]"
        case "{":
            return "}"
        default:
            return " "
        }
    }
}