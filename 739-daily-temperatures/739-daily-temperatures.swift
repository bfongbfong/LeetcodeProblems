class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: temperatures.count)
        var stack = [(Int, Int)]()
        for i in 0..<temperatures.count {
            while !stack.isEmpty && stack.last!.0 < temperatures[i] {
                let (stackTop, index) = stack.removeLast()
                answer[index] = i - index
            }
            stack.append((temperatures[i], i))
        }
        return answer
    }
}