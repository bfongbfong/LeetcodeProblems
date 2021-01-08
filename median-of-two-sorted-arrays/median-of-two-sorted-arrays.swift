                continue
            }
            if secondI >= nums2.count {
                answer.append(nums1[firstI])
                firstI += 1
                continue
            }
            
            let firstNum = nums1[firstI]
            let secondNum = nums2[secondI]
            
            if firstNum <= secondNum {
                answer.append(firstNum)
                firstI += 1
            }
            
            else {
                answer.append(secondNum)
                secondI += 1
            }   
        }
        
        return answer
    }
    
    private func findMedian(_ nums: [Int]) -> Double {
        if nums.isEmpty { return 0 }
        
        if nums.count % 2 == 1 {
            let midIndex = nums.count / 2
            return Double(nums[midIndex])
        } else {
            let midRightIndex = nums.count / 2
            let midLeftIndex = (nums.count / 2) - 1
            print("midLeftIndex \(midLeftIndex), midRightIndex \(midRightIndex)")
            let sum = (Double(nums[midLeftIndex]) + Double(nums[midRightIndex]))
            print("sum: \(sum)")
            return sum / 2
        }
    }
}
