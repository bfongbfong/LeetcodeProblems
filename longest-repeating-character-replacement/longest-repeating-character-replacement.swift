class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let charArray = Array(s)
        
        var maxContigSeqCount = 0
        var charCount = Array(repeating: 0, count: 26)
        var maxLetterInWindowCount = 0
        
        // sliding window problem
        var startI = 0
        for endI in 0..<charArray.count {
            // check the most common letter inside my window
            charCount[Int(charArray[endI].asciiValue! - 65)] += 1
            let currentCharCount = charCount[Int(charArray[endI].asciiValue! - 65)]
            maxLetterInWindowCount = max(maxLetterInWindowCount, currentCharCount)
            
            while endI - startI + 1 - maxLetterInWindowCount > k {
                charCount[Int(charArray[startI].asciiValue! - 65)] -= 1
                startI += 1
            }
            
            maxContigSeqCount = max(maxContigSeqCount, endI - startI + 1)
        }
        
        return maxContigSeqCount
    }
}
