class Solution {
    func alphabetNum(_ s: String) -> Int {
        return Int(UnicodeScalar(s)!.value) - 97
    }
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var alphabet = [Int](repeating: 0, count: 26)
        let first = Array(s)
        let second = Array(t)
        
        for i in 0..<first.count {
            alphabet[alphabetNum(String(first[i]))] += 1
            alphabet[alphabetNum(String(second[i]))] -= 1
        }
        
        for num in alphabet {
            if num != 0 {
                return false
            }
        }
        
        return true
    }
}
