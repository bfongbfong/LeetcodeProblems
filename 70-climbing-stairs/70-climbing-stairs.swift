class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        /*
        1 - 1
        2 - 2
        3 - 3
        4 - 5
            1 1 1 1 
            1 2 1
            2 1 1
            1 1 2
            2 2
        5 - 8
            1 1 1 1 1 
            2   1 1 1 
            1 2   1 1
            1 1 2.  1
            1 1 1 2
            2   2.  1
            2.  1  2
            1 2   2
        */

        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2..<dp.count {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
}