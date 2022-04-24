class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // if right is ever less than left, move the left to equal the right nad righ tto be right + 1
        var left = 0
        var right = 1
        var answer = 0
        while right < prices.count {
            answer = max(answer, prices[right] - prices[left])
            if prices[right] < prices[left] {
                left = right
                right = right + 1
            } else {
                right += 1
            }
        }
        return answer
    }
}