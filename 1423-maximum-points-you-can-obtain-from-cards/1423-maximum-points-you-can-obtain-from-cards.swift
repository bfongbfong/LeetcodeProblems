class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        let windowSize = cardPoints.count - k
        var left = 0
        var right = windowSize - 1
        var answer = 0
        var sum = 0
        for i in stride(from: cardPoints.count - 1, through: cardPoints.count - k, by: -1) {
            sum += cardPoints[i]
        }
        while right < cardPoints.count - 1 {
            answer = max(answer, sum)
            sum += cardPoints[left]
            left += 1
            right += 1
            sum -= cardPoints[right]
        }
        answer = max(answer, sum)
        return answer
    }
}