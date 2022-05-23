class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var answer = [[Int]]()
        var candidates = candidates.sorted()
        // used is a set of indexes
        func helper(_ i: Int, _ currSum: Int, _ curr: [Int]) {
            if currSum == target {
                answer.append(curr)
                return
            } else if currSum > target { 
                return 
            }
            if i >= candidates.count { return }
            var nextI = i + 1
            while nextI < candidates.count && candidates[nextI] == candidates[i] {
                nextI += 1
            }
            helper(nextI, currSum, curr)
            var currSum = currSum
            var curr = curr
            currSum += candidates[i]
            curr.append(candidates[i])
            helper(i + 1, currSum, curr)  
        }
        helper(0, 0, [])
        return answer
    }
}