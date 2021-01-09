class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var leftI = 0
        var rightI = height.count - 1
        var largestArea = Int.min
        while leftI < rightI {
            let leftH = height[leftI]
            let rightH = height[rightI]
            let width = rightI - leftI
            print("leftI: \(leftI), rightI: \(rightI)") 
            print("leftH: \(leftH), rightH: \(rightH)")
            var shorterH: Int
            var shorterI: Int
            if leftH < rightH {
                shorterH = leftH
                shorterI = leftI
            } else {
                shorterH = rightH
                shorterI = rightI
            }
            
            print("width: \(width)")
            print("shorter height: \(shorterH)")
            let area = shorterH * width
            largestArea = max(largestArea, area)
            print("largestArea: \(largestArea)")
            if leftH < rightH {
                leftI += 1
            } else {
                rightI -= 1
            }
        }
        return largestArea
    }
}
