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
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var answer = 0
        func getDepth(_ nestedInt: NestedInteger, _ depth: Int) {
            if nestedInt.isInteger() {
                answer += (nestedInt.getInteger() * (depth + 1))
            } else {
                for next in nestedInt.getList() {
                    getDepth(next, depth + 1)
                }
            }
        }
        for val in nestedList {
            getDepth(val, 0)
        }
        return answer
    }
}