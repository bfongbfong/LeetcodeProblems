class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let stringX = String(x)
        let chars = Array(stringX)
        var reverseChars = [Character]()
        for i in stride(from: chars.count - 1, through: 0, by: -1) {
            reverseChars.append(chars[i])
        }
        return String(reverseChars) == stringX
    }
}