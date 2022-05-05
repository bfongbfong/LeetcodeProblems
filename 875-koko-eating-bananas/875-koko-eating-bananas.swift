class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var biggestPile = Int.min
        for num in piles {
            biggestPile = max(biggestPile, num)
        }

        var left = 0
        var right = biggestPile 
        while left <= right {
            let mid = left + ((right - left) / 2)
            var count1 = 0
            for num in piles {
                count1 += Int(ceil(Double(num) / Double(mid)))
            }
            print("count1: \(count1)")

            guard mid - 1 >= 1 else { // can't divide by 0
                left = mid + 1 
                continue 
            }
            var count2 = 0
            for num in piles {
                count2 += Int(ceil(Double(num) / Double((mid - 1))))
            }

            print("coun2: \(count2)")
            print("mid: \(mid), mid - 1: \(mid - 1)")
            if count2 <= h && mid - 1 == 1 {
                return mid - 1
            } else if count2 > h && count1 <= h {
                return mid
            } else if count2 <= h {
                // move left
                right = mid - 1
            } else {
                left = mid + 1
            }

            
        }
        return biggestPile
    }
}