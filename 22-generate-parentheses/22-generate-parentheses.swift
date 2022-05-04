class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var answer = [String]()
        func helper(open: Int, close: Int, chars: [Character]) {
            if open == close && open == n {
                answer.append(String(chars))
                return
            }
            // can only add a close if there are more opens than closes
            if open > close {
                var chars = chars
                chars.append(")")
                helper(open: open, close: close + 1, chars: chars)
            }
            if open < n {
                var chars = chars
                chars.append("(")
                helper(open: open + 1, close: close, chars: chars)
            }
        }
        helper(open: 0, close: 0, chars: [])
        return answer
    }
}