class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        /*
        -- --
         ---
        
        --  --
          --
        
        -- --
      --
        
        -- --
             --
        
        -- --
         -----
        
        -- --
       ---- 

        -- --
       ------- 
        
        1. first check if there is any overlap. if so, merge the two intervals together. 
        then, in the next iteration, see if the current interval (the one you just merged) needs to be merged with the next interval
        and so on 
        merge them one by one. if the next one overlaps, merge it again?
        */
        var answer = [[Int]]()

        var newInterval = newInterval
        if intervals.isEmpty { return [newInterval] }
        for interval in intervals {
            if newInterval.isEmpty {
                answer.append(interval)
            }
            // if newInterval completely goes first, then interval
            else if newInterval[1] < interval[0] {
                answer.append(newInterval)
                answer.append(interval)
                newInterval.removeAll()
            } 
            // interval completely goes first
            else if interval[1] < newInterval[0] {
                answer.append(interval)
            } else if newInterval[0] < interval[0] {
                newInterval = [newInterval[0], max(newInterval[1], interval[1])]
            } else {
                newInterval = [interval[0], max(newInterval[1], interval[1])]
            }
        }
        if !newInterval.isEmpty {
            answer.append(newInterval)
        }
        return answer
    }
}