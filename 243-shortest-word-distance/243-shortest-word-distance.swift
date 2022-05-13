class Solution {
    func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
        var word1I = -1
        var word2I = -1
        var answer = Int.max
        for i in 0..<wordsDict.count {
            let word = wordsDict[i]
            if word == word1 {
                word1I = i
                if word2I != -1 {
                    answer = min(answer, word1I - word2I)
                }
            }
            if word == word2 {
                word2I = i
                if word1I != -1 {
                    answer = min(answer, word2I - word1I)
                }
            }
        }
        return answer
    }
}