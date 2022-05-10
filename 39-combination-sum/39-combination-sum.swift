class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var answer = [[Int]]()
        func helper(_ i: Int, _ currentNums: [Int]) {
            let sum = currentNums.reduce(0, +)
            // print(i, currentNums)

            if sum == target {
                // add the answer here
                answer.append(currentNums)
                return
            } else if sum > target {
                // noop
                return
            } else {
                // keep going further down 
                var nums = currentNums
                nums.append(candidates[i])
                helper(i, nums)
            }
            if i + 1 < candidates.count {
                helper(i + 1, currentNums)
            }
            
        }
        helper(0, [])
        return answer
    }
}