class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var answer = [[Int]]()
        var intervals = intervals.sorted{ $0[0] < $1[0] }
        for i in 0..<intervals.count {
            if i == intervals.count - 1 {
                answer.append(intervals[i])
                return answer
            }

            // 0 2.  1 4.  3 5
            // merge interval[i] and interval[i + 1] into interval[i + 1]
            if intervals[i][1] < intervals[i + 1][0] {
                answer.append(intervals[i])
            } 
            // if i + 1 belongs completely behind 1 
            // else if intervals[i + 1][0] < intervals[i][0] && intervals[i + 1][1] < intervals[i][1] && intervals[i + 1][1] < intervals[i][0] {
            //     let temp = intervals[i + 1]
            //     intervals[i + 1] = intervals[i]
            //     intervals[i] = temp
            //     answer.append(intervals[i])
            // } 
            // merge
            else {
                intervals[i + 1] = [min(intervals[i][0], intervals[i + 1][0]), max(intervals[i][1], intervals[i + 1][1])]
            }
        }
        return answer
    }
}