
class WordDistance {

    var words: [String]
    init(_ wordsDict: [String]) {
        words = wordsDict
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        var word1I = -1
        var word2I = -1
        var answer = Int.max
        for i in 0..<words.count {
            if words[i] == word1 {
                word1I = i
                if word2I != -1 {
                    answer = min(answer, word1I - word2I)
                }
            }
            if words[i] == word2 {
                word2I = i
                if word1I != -1 {
                    answer = min(answer, word2I - word1I)
                }
            }
        }
        return answer
    }
}

/**
 * Your WordDistance object will be instantiated and called as such:
 * let obj = WordDistance(wordsDict)
 * let ret_1: Int = obj.shortest(word1, word2)
 */