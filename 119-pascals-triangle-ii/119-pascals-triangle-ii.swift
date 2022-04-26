class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var answer = [[Int]]()
        for i in 0..<rowIndex + 1 {
            if i == 0 {
                answer.append([1])
            } else {
                var thisRow = [1]
                let prev = answer[i - 1]
                for j in 0..<prev.count {
                    if j + 1 < prev.count {
                        thisRow.append(prev[j] + prev[j + 1])
                    } else {
                        thisRow.append(1)
                    }
                }
                answer.append(thisRow)
            }
        }
        return answer.last ?? []
    }
}