class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var dict1 = [Character: Character]()
        var dict2 = [Character: Character]()
        if s.count != t.count { return false }
        let sChars = Array(s)
        let tChars = Array(t)
        
        for i in 0..<s.count {
            if dict1[sChars[i]] == nil && dict2[tChars[i]] == nil {
                dict1[sChars[i]] = tChars[i]
                dict2[tChars[i]] = sChars[i]
            } else if dict1[sChars[i]] != nil {
                if dict1[sChars[i]]! != tChars[i] {
                    return false
                }
            } 
            else if dict2[tChars[i]] != nil {
                if dict2[tChars[i]] != sChars[i] {
                    return false
                }
            }
        }
        return true
    }
}
