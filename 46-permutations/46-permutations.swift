class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        /*
        1            2           3 4 5
        2 3 4 5      1 3 4 5
        */
        func dfs(_ included: [Int], _ includedSet: Set<Int>) -> [[Int]] {
            // either add your index or skip it
            if includedSet.count == nums.count {
                return [included]
            }

            var answer: [[Int]] = []

            for i in 0..<nums.count {
                if includedSet.contains(i) { continue }
                var included = included
                included.append(nums[i])
                var includedSet = includedSet
                includedSet.insert(i)
                answer.append(contentsOf: dfs(included, includedSet))
            }
            return answer
        }

        return dfs([], [])
    }
}