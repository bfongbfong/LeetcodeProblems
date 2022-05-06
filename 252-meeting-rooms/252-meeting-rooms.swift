class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        var intervals = intervals.sorted(by: { $0[0] < $1[0] })
        for i in 0..<intervals.count {
            if i + 1 < intervals.count {
                if intervals[i + 1][0] < intervals[i][1] {
                    return false
                }
            }
        }
        return true
    }
}