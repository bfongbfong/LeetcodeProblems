class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dictS = [Character: Int]()
        var dictT = [Character: Int]()
        let s = Array(s)
        let t = Array(t)
        for letter in s {
            if dictS[letter] != nil {
                dictS[letter]? += 1
            } else {
                dictS[letter] = 1
            }
        }

        for letter in t {
            if dictT[letter] != nil {
                dictT[letter]? += 1
            } else {
                dictT[letter] = 1
            }
        }
        return dictS == dictT
    }
}