class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        func findPivotPoint() -> Int {
            var leftI = 0
            var rightI = nums.count - 1
            while leftI <= rightI {
                let midIndex = leftI + ((rightI - leftI + 1) / 2)
                
                if midIndex == 0 || nums[midIndex] < nums[midIndex - 1] {
                    return midIndex
                } else if nums[0] > nums[midIndex] {
                    // go left
                    rightI = midIndex - 1
                } else {
                    // go right
                    leftI = midIndex + 1
                }
            }
            return 0
        }
        
        func binarySearch(_ leftIndex: Int, _ rightIndex: Int) -> Int {
            var leftI = leftIndex
            var rightI = rightIndex
            while leftI <= rightI {
                let midIndex = leftI + ((rightI - leftI) / 2)
                let midPoint = nums[midIndex]
                
                if midPoint == target {
                    return midIndex
                } else if target < midPoint {
                    // go left
                    rightI = midIndex - 1
                } else {
                    // go right
                    leftI = midIndex + 1
                }
            }
            
            return -1
        }
        
        let pivotPoint = findPivotPoint()
        print("pivotPoint: \(pivotPoint)")
        if target == nums[pivotPoint] {
            return pivotPoint
        }
        else if pivotPoint == 0 || target < nums[0] {
            // it's on the right side of the pivot
            return binarySearch(pivotPoint, nums.count - 1)
        } else {
            return binarySearch(0, pivotPoint - 1)
        }
    }
}
