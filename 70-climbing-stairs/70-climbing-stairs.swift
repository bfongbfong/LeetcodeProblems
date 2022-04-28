class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp = [Int: Int]()
        func helper(_ n: Int) -> Int {
            if let answer = dp[n] { return answer }
            if n == 1 {
                dp[n] = 1
                return 1
            }
            else if n == 2 {
                dp[n] = 2
                return 2
            }

            let oneStep: Int
            if let existingOneStep = dp[n - 1] {
                oneStep = existingOneStep
            } else {
                oneStep = helper(n - 1)
                dp[n - 1] = oneStep
            }
    
            let twoStep: Int
            if let existingTwoStep = dp[n - 2] {
                twoStep = existingTwoStep
            } else {
                twoStep = helper(n - 2)
                dp[n - 2] = twoStep
            }

            return oneStep + twoStep
        }
        return helper(n)
    }
}