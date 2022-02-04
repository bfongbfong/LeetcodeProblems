class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [[Int]]() }
        let sorted = nums.sorted()
        var answer = [[Int]]()

        for i in 0..<sorted.count {
            if i != 0, sorted[i] == sorted[i - 1] { continue }
            var leftI = i + 1
            var rightI = sorted.count - 1
            while leftI < rightI {
                let sum = sorted[leftI] + sorted[rightI] + sorted[i]
                if sum == 0 {
                    answer.append([sorted[leftI], sorted[rightI], sorted[i]])
                    leftI += 1
                    while sorted[leftI] == sorted[leftI - 1] && leftI < rightI {
                        leftI += 1
                    }
                } else if sum < 0 {
                    leftI += 1
                } else {
                    rightI -= 1
                }
            }
        }
        return answer
    }
}