class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        /*
        1        2 3
        [] 1
             1 2
        */
        func dfs(_ i: Int, _ included: [Int]) -> [[Int]] {
            if i >= nums.count {
                return [included]
            }
            var answer = [[Int]]()

            // don't add the number 
            answer.append(contentsOf: dfs(i + 1, included))

            // add the number and don't add the number
            var nextIncluded = included
            nextIncluded.append(nums[i])
            answer.append(contentsOf: dfs(i + 1, nextIncluded))

            return answer
        }
        return dfs(0, [])
    }
}