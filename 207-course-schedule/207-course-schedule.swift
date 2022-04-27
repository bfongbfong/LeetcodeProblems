class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // 3
        // [1, 0] [2, 3] [3, 4]
        var dict = [Int: [Int]]()
        for num in prerequisites {
            if dict[num[0]] != nil {
                dict[num[0]]!.append(num[1])
            } else {
                dict[num[0]] = [num[1]]
            }
        }
        var visitedSet = Set<Int>()

        func dfs(_ course: Int) -> Bool {
            if visitedSet.contains(course) { return false }
            if let prereqs = dict[course] {
                visitedSet.insert(course)
                for p in prereqs {
                    if !dfs(p) {
                        return false
                    }
                }
                visitedSet.remove(course)
                dict[course] = nil
                return true
            } else {
                return true
            }
        }

        for i in 0..<numCourses {
            if !dfs(i) { return false }
        }
        return true
    }
}