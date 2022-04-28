class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var leftI = 0
        var rightI = height.count - 1
        var answer = 0
        while leftI < rightI {
            let left = height[leftI]
            let right = height[rightI]
            let width = rightI - leftI
            let height = min(left, right)
            let area = width * height
            answer = max(answer, area)
            if left < right {
                leftI += 1
            } else {
                rightI -= 1
            }
        }
        return answer
    }
}