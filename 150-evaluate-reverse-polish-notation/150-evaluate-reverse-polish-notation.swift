class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
            } else {
                let second = stack.removeLast()
                let first = stack.removeLast()
                switch token {
                case "+":
                    stack.append(first + second)
                case "-":
                    stack.append(first - second)
                case "*":
                    stack.append(first * second)
                case "/":
                    stack.append(first / second)
                default:
                    break
                }
            }
        }
        return stack.last!
    }
}