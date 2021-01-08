class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        // i want to change the array so that it never decreases
        
        // 5 4 6 8 9 
        // just check if it goes down more than once
        var n = nums
        
        // the plan is to flatten any downward movement 
        // or to flatten any hill into a straight or upward line
        
        var modificationMade = false 
        for i in 0..<n.count {
            if i + 1 < n.count {
                if n[i + 1] < n[i] {
                    if modificationMade { return false }
                    // if right is lower than left, try changing next one
                    let right = n[i + 1]
                    var left: Int
                    
                    if i - 1 >= 0 {
                        left = n[i - 1]
                    } else {
                        left = Int.min
                    }
                    
                    if right < left { 
                        // try changing next one 
                        n[i + 1] = n[i]
                        modificationMade = true
                    } else {
                        // try changing the current one 
                        n[i] = n[i + 1]
                        modificationMade = true
                    } 
                } 
            }
        }
        
        
        return true
    }
}
