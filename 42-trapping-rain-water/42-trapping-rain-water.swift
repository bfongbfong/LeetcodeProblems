class Solution {
    func trap(_ height: [Int]) -> Int {
        // create array of highest number to right at each point
        var highestRight = [Int]()
        var highest = 0
        for i in stride(from: height.count - 1, through: 0, by: -1) {
            if i == height.count - 1 {
                highestRight.append(0)
            } else {
                highestRight.append(highest)
            }
            highest = max(highest, height[i])
        }
        highestRight.reverse()

        // create array of highest left number
        var highestLeft = [Int]()
        var hLeft = 0
        for i in 0..<height.count {
            if i == 0 {
                highestLeft.append(0)
            } else {
                highestLeft.append(hLeft)
            }
            hLeft = max(hLeft, height[i])
        }
        
        var answer = 0
        for i in 0..<height.count {
            // find max left and max right
            let maxLeft = highestLeft[i]
            let maxRight = highestRight[i]
            let h = min(maxLeft, maxRight)
            var addition = h - height[i]
            if addition < 0 { addition = 0 }
            answer += addition
        }
        return answer
    }
}