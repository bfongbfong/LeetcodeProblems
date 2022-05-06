class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        /*
        "yffffbgffffgbbbbgssssgthyyyy"
        4
        aa
        */
        if s.count <= 1 { return s }
        var s = Array(s)
        var leftI = 0
        var rightI = 1
        while rightI < s.count {
            if s[rightI] == s[leftI] {
                if rightI - leftI + 1 == k {
                    for i in 0..<k {
                        s.remove(at: leftI)
                    }
                    if leftI - 1 >= 0 {
                        leftI -= 1   
                    }
                    rightI = leftI
                    while leftI - 1 >= 0 && s[leftI - 1] == s[leftI] {
                        leftI -= 1
                    } 
                } else {
                    rightI += 1   
                }
            } else {
                leftI = rightI
                rightI += 1
            }
        }
        return String(s)
    }
}