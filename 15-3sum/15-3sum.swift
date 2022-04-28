class Solution {
    // -4 -1 -1 0 1 2
    // 0 0 0 0 
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var answer = [[Int]]()
        for i in 0..<nums.count {
            if i - 1 >= 0 && nums[i - 1] == nums[i] { continue }
            if i == nums.count - 2 { break }
            var leftI = i + 1 
            var rightI = nums.count - 1
            while leftI < rightI {
                if nums[leftI] + nums[rightI] + nums[i] == 0 {
                    answer.append([nums[i], nums[leftI], nums[rightI]])
                    leftI += 1 
                    while nums[leftI] == nums[leftI - 1] && leftI < rightI {
                        leftI += 1
                    }
                } else if nums[leftI] + nums[rightI] + nums[i] > 0 {
                    rightI -= 1
                } else {
                    leftI += 1
                }
            }
        }

        return answer
    }

}