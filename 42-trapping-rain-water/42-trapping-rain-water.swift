class Solution {
    func trap(_ height: [Int]) -> Int {
        var answer = 0
        for i in 0..<height.count {
            // find max left and max right
            let maxLeft = Array(height[0..<i]).max() ?? 0
            let maxRight = Array(height[i + 1..<height.count]).max() ?? 0
            let h = min(maxLeft, maxRight)
            var addition = h - height[i]
            if addition < 0 { addition = 0 }
            answer += addition
        }
        return answer
    }
}