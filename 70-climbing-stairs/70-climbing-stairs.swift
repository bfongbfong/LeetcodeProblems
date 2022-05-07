class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        // var dp = Array(repeating: 0, count: n + 1)
        // 2 1 1 
        var one = 1
        var two = 1
        for i in 2..<n + 1 {
            let val = one + two
            two = one
            one = val
        }
        return one
    }
}