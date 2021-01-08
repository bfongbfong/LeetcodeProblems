class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        // 1 0 0 0 0 0 1
        // if there is a group of three 0's, you can plant one flower
        // for each group of 3 0's. every extension of 2 more zero's means another flower can fit there
        // on the left and right edges, if it starts with 00, then that you can fit a flower there. 
        
        // loop through 
        // keep a second array with the places to plant 
        // each time there is a one on the side, mark the spot as unplantable 
        // no, just increment the count
        
        var availableSpots = 0
        var flowers = flowerbed
        
​
        for i in 0..<flowers.count {
            var leftGood = false
            var rightGood = false
            
            if flowers[i] == 1 {
                continue
            } 
            // check left and check right 
            if i - 1 < 0 {
                leftGood = true
            } else if flowers[i - 1] != 1 {
                leftGood = true
            } else {
                leftGood = false
            }
            
            if i + 1 >= flowers.count {
                rightGood = true
            } else if flowers[i + 1] != 1 {
                rightGood = true
            } else {
                rightGood = false
            }
            
            if leftGood && rightGood {
                availableSpots += 1
                flowers[i] = 1
            }
        }
        return availableSpots >= n
    }
}
