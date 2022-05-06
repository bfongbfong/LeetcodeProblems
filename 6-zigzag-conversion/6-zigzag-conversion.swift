class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        // skip every numRows - 1 + numRows - 2
        if numRows == 1 { return s }
        var s = Array(s)
        var answer = [Character]()
        for i in 0..<numRows {
            // top and bottom go by (numRows - 1) * 2 
            if i == 0 || i == numRows - 1 {
                var index = i
                while index < s.count {
                    answer.append(s[index])
                    index += ((numRows - 1 ) * 2)
                }
            } else {
                var index = i
                var count = 0
                var shift = 0
                while index < s.count {
                    answer.append(s[index])
                    if count % 2 == 0 {
                        shift = (((numRows - 1) * 2) - (i * 2))   
                        index += shift
                    } else {
                        index += ((numRows - 1 ) * 2) - shift   
                    }
                    count += 1
                }
            }
        }
        return String(answer)
    }
}