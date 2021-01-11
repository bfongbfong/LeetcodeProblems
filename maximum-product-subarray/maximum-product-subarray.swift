class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        // the absolute value of the number will always go up as we go forward (unless we see a zero)
        // so we must keep track of the two largest abs value numbers, namely the largest and the smallest number (the smallest will be the MOST negative number)
        
        // each time you iterate, multiply the max and min by the new number, and update the new max and min. 
        if nums.isEmpty { return -1 }
        var maxProd = nums[0]
        var minProd = nums[0]
        var totalMaxProd = nums[0]
        
        for i in 1..<nums.count {
            print("num: \(nums[i]), maxProd: \(maxProd), minProd: \(minProd)")
            let temp = maxProd
            maxProd = max(max(maxProd * nums[i], minProd * nums[i]), nums[i])
            minProd = min(min(minProd * nums[i], temp * nums[i]), nums[i])
            print("---num: \(nums[i]), maxProd: \(maxProd), minProd: \(minProd)")
            
            totalMaxProd = max(maxProd, totalMaxProd)
        }
        
        return totalMaxProd
    }
}
