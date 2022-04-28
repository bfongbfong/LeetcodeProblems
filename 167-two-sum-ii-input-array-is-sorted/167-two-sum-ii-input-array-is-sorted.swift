class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for i in 0..<numbers.count {
            let compliment = target - numbers[i]
            var leftI = i + 1
            var rightI = numbers.count - 1
            while leftI <= rightI {
                let mid = leftI + ((rightI - leftI) / 2)
                if numbers[mid] == compliment {
                    return [i + 1, mid + 1]
                } else if compliment > numbers[mid] {
                    // go right
                    leftI = mid + 1
                } else {
                    rightI = mid - 1
                }
            }
        }
        return []
    }
}