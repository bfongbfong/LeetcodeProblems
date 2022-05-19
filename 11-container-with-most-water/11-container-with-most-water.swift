class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var answer = 0
        while left < right {
            let width = right - left
            let thisHeight = min(height[left], height[right])
            let area = width * thisHeight
            answer = max(answer, area)
            if height[left] < height[right] {
                left += 1
            } else if height[right] < height[left] {
                right -= 1
            } else {
                left += 1
                right -= 1
            }
        }
        return answer
    }
}