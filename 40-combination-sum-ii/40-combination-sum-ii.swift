class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var answer = [[Int]]()
        var candidates = candidates.sorted()
        // used is a set of indexes
        func helper(_ i: Int, _ target: Int, _ curr: [Int]) {
            var curr = curr
            if target == 0 {
                answer.append(curr)
                return
            } else if target < 0 { 
                return 
            }
            var prev = -1
            for j in i..<candidates.count {
                if candidates[j] == prev { continue }
                curr.append(candidates[j])
                helper(j + 1, target - candidates[j], curr)
                curr.removeLast()
                prev = candidates[j]
            }
        }
        helper(0, target, [])
        return answer
    }
}