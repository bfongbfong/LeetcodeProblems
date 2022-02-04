class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var leftI = 0
        var rightI = numbers.count - 1
        while leftI < rightI {
            let sum = numbers[leftI] + numbers[rightI]
            if sum == target {
                return [leftI + 1, rightI + 1]
            } else if sum < target {
                leftI += 1
            } else if sum > target {
                rightI -= 1
            }
        }
        return []
    }
}