class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var answer = 0
        for i in 0..<accounts.count {
            answer = max(accounts[i].reduce(0, +), answer)
        }
        return answer
    }
}