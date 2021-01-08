class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var dict: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
                   ]
    
        func helper(_ input: [Character]) -> [[Character]] {
            if let first = input.first {
                var newInput = input
                newInput.removeFirst()
                let letters = dict[first]!
                var returnCombos = [[Character]]()
                for pref in letters {
                    if input.count == 1 {
                        returnCombos.append([pref])
                    }
                    var nextSuffixes = helper(newInput)
                    for i in 0..<nextSuffixes.count {
                        nextSuffixes[i].insert(pref, at: 0)
                    }
                    returnCombos += nextSuffixes
                }
                return returnCombos
            } else {
                return []
            }
        }
        
        var answer = helper(Array(digits))
        var trueAnswer = [String]()
        for i in 0..<answer.count {
            trueAnswer.append(String(answer[i]))
        }
        
        return trueAnswer
    }
}
