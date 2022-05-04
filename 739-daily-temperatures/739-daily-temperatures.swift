class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answer = [Int]()
        for i in 0..<temperatures.count {
            var index = i + 1
            while index < temperatures.count && temperatures[index] <= temperatures[i] {
                index += 1
            }
            if index == temperatures.count {
                answer.append(0)
            } else {
                answer.append(index - i)
            }
        }
        return answer
    }
}