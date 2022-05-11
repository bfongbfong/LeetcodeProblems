class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        /*
        1            2           3 4 5
        2 3 4 5      1 3 4 5
        */
        func dfs(_ included: [Int], _ numbers: [Int]) -> [[Int]] {
            // either add your index or skip it
            if included.count == nums.count {
                return [included]
            }

            var answer: [[Int]] = []

            for i in 0..<numbers.count {
                var included = included
                included.append(numbers[i])
                var numbers = numbers
                numbers.remove(at: i)
                answer.append(contentsOf: dfs(included, numbers))
            }
            return answer
        }

        return dfs([], nums)
    }
}