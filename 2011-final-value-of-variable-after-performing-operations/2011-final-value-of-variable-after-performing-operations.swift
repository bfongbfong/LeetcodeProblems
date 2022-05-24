class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        var x = 0
        for operation in operations {
            if operation.contains("++") {
                x += 1
            } else {
                x -= 1
            }
        }
        return x
    }
}