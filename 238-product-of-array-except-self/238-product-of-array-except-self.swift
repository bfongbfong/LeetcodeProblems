class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefix = Array(repeating: 0, count: nums.count)
        var postfix = Array(repeating: 0, count: nums.count)
        var answer = [Int]()

        var postfixProd = 1
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            postfix[i] = postfixProd
            postfixProd *= nums[i]
        }

        var prefixProd = 1
        for i in 0..<nums.count {
            prefix[i] = prefixProd
            prefixProd *= nums[i]
            answer.append(prefix[i] * postfix[i])
        }

        return answer
    }
}