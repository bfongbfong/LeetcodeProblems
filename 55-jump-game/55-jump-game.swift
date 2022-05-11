class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var memo = [Int: Bool]()
        func dfs(_ i: Int) -> Bool {
            if i >= nums.count { return false }
            if i == nums.count - 1 { return true }
            if memo[i] != nil { return memo[i]! }
            for jump in stride(from: nums[i], through: 1, by: -1) {
                if dfs(i + jump) {
                    return true
                }
            }
            memo[i] = false
            return false
        }
        return dfs(0)
    }
}