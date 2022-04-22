class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var intervals = intervals.sorted { $0[0] < $1[0] }
        /* 
        1 3.   2 4.    3 5.    4 7    8 9.   10 11
        overlapping = they are the exact same interval, or they literally overlap (just one number being the same is fine)
        -- --
         ---
        
        --  --
         ---
        
        -- --
        ----
        
        ---
        --
        
        --
        ---
        
        */
        var answer = 0
        var prevEnd = intervals[0][1]
        for i in 1..<intervals.count {
            if intervals[i][0] >= prevEnd {
                prevEnd = intervals[i][1]
            } else {
                answer += 1
                prevEnd = min(intervals[i][1], prevEnd)
            }
        }
        return answer
    }
}