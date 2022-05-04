class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dict = [Character: Int]()
        for char in Array(s1) {
            if dict[char] == nil {
                dict[char] = 1
            } else {
                dict[char]! += 1
            }
        }

        let s2 = Array(s2)
        var left = 0
        var right = 0
        var currentDict = [Character: Int]()
        while right < s2.count {
            if currentDict[s2[right]] == nil {
                currentDict[s2[right]] = 1
            } else {
                currentDict[s2[right]]! += 1
            }

            if dict == currentDict {
                return true
            }
            if right - left + 1 < s1.count {
                right += 1
            } else {
                right += 1
                if currentDict[s2[left]]! == 1 {
                    currentDict[s2[left]] = nil
                } else {
                    currentDict[s2[left]]! -= 1
                }
                left += 1
            }
        }
        return false
    }
}