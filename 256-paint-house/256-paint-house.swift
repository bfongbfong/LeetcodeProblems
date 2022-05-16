class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        /*
        houses  red     blue    green
        0       17      2       17
        1       16      16      5
        2       14      3       19
        */

        var memo = Array(repeating: Array(repeating: Int.max, count: costs[0].count), count: costs.count)
        // each spot in memo represents the smallest sum itself + its children.
        func helper(_ houseI: Int, _ adjacentColor: Int) -> Int {
            if houseI >= costs.count {
                return 0
            }
            var thisAnswer = Int.max
            for color in 0..<costs[houseI].count {
                if adjacentColor == color { continue }
                if memo[houseI][color] != Int.max { 
                    thisAnswer = min(thisAnswer, memo[houseI][color])
                    continue
                }
                let childrenMinSum = helper(houseI + 1, color)
                let minSum = childrenMinSum + costs[houseI][color]
                print(costs[houseI][color], childrenMinSum, minSum)
                memo[houseI][color] = minSum
                thisAnswer = min(thisAnswer, minSum)
                print("-- \(thisAnswer)")
            }
            return thisAnswer
        }
        return helper(0, -1)
    }
}