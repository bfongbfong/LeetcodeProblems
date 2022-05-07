class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1..<dp.count {
            for coin in coins {
                let remainder = i - coin
                if remainder >= 0 {
                    dp[i] = min(dp[i], 1 + dp[remainder])
                }
            }
        }

        if dp[amount] != amount + 1 {
            return dp[amount]   
        } else {
            return -1
        }
    }
}