class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        /*
        1 - 5
        4 - 7 <- intersects 1st only
        6 - 10 <- intersects 2nd only
        answer : 2
        
        1 - 5 
        2 - 7 <- they all intersect, every combo
        3 - 10 <-
        answer: 3
        
        1 - 10
        2 - 7 <- intersects first only
        8 - 9 <- intersects first only
        answer: 2
        
        won't say a meeting is over until you've reached a starting point higher than that meeting
        */
        if intervals.isEmpty { return 0 }
        var startTimes = intervals.sorted(by: { $0[0] < $1[0] }).map { $0[0] }
        var endTimes = intervals.sorted(by: { $0[1] < $1[1] }).map { $0[1] }
        var amountOfMeetings = 0
        var maxConcurrentMeetings = 0

        var startI = 0
        var endI = 0
        while startI < startTimes.count && endI < endTimes.count {
            if startTimes[startI] < endTimes[endI] {
                amountOfMeetings += 1
                maxConcurrentMeetings = max(maxConcurrentMeetings, amountOfMeetings)
                startI += 1
            } else {
                amountOfMeetings -= 1
                endI += 1
            }
        }
        return maxConcurrentMeetings
    }
}