class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var s = Array(s)
        var stack = [(Character, Int)]()
        var i = 0
        while i < s.count {
            if s[i] == "(" {
                stack.append(("(", i))
                i += 1
            } else if stack.isEmpty && s[i] == ")" {
                // print("removing \(s[i]) at \(i)")
                s.remove(at: i)
                // print(s)
            } else if let top = stack.last, top.0 == "(", s[i] == ")" {
                // print("removing last item from stack: \(stack.last!)")
                stack.removeLast()
                // print(s)
                i += 1
            } else {
                i += 1
            }
        }

        for i in stride(from: stack.count - 1, through: 0, by: -1) {
            // print("-removing \(s[i]) at \(i)")
            s.remove(at: stack[i].1)
            // print(s)
        }

        return String(s)
    }
}
/*

"()()((("
     (((

*/