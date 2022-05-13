/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        var maxDepth = 0
        var depths = [(Int, Int)]()
        func getDepth(_ nestedInt: NestedInteger, _ depth: Int) {
            if nestedInt.isInteger() {
                depths.append((nestedInt.getInteger(), depth + 1))
                maxDepth = max(maxDepth, depth + 1)
            } else {
                let list = nestedInt.getList()
                for val in list {
                    getDepth(val, depth + 1)
                }
            }
        }
        for num in nestedList {
            getDepth(num, 0)
        }
        var answer = 0
        for i in 0..<depths.count {
            answer += ((maxDepth - depths[i].1 + 1) * depths[i].0)
        }
        return answer
    }
}