class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        /*
        houses  red     blue    green
        0       17      2       17
        1       16      16      5
        2       14      3       19
        */

        var dp = Array(repeating: Array(repeating: Int.max, count: costs[0].count), count: costs.count)
        dp.append([0, 0, 0])
        for houseI in stride(from: costs.count - 1, through: 0, by: -1) {
            for color in 0..<costs[houseI].count {
                var minChildrenSum = Int.max
                for nextColor in 0..<dp[houseI + 1].count {
                    if nextColor == color { continue }
                    minChildrenSum = min(minChildrenSum, dp[houseI + 1][nextColor])
                }
                dp[houseI][color] = minChildrenSum + costs[houseI][color]
            }
        }
        return min(min(dp[0][0], dp[0][1]), dp[0][2])
    }
}