class Solution {
    func climbStairs(_ n: Int) -> Int {
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
        var memo = [Int: Int]()
        func helper(_ input: Int) -> Int {
            if input == n { return 1 }
            if input > n { return 0 }
            var first = 0
            if memo[input + 1] != nil {
                first = memo[input + 1]!
            } else {
                first = helper(input + 1)
            }

            var second = 0
            if memo[input + 2] != nil {
                second = memo[input + 2]!
            } else {
                second = helper(input + 2)
            }

            memo[input] = first + second
            return memo[input]!
        }
        return helper(0)
    }
}