class Solution {
    func rob(_ nums: [Int]) -> Int {
        var oneBack = 0
        var twoBack = 0
        for n in nums {
            let temp = max(twoBack + n, oneBack)
            twoBack = oneBack
            oneBack = temp
        }
        return oneBack
    }
}