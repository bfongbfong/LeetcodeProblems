class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        /*
        start from left, with two pointers.
        move them until we find all the needed letters. once that happens, basically keep track of the order of the important letters from left to right. 
        once you find enough duplicates of the most left number to drop it, drop it and iterate the left pointer to the next important number.
        to do this we would need an array which stores the important letters and their indexes 
        and also keep a dictionary to track if we have satisfied the condition or not
        most left elemet = A
        most right element = C
        .
        ADOBECODEB A  N  C
        0  3 5   9 10    12
        */
        var tDict = [Character: Int]()
        for letter in t {
            if tDict[letter] == nil {
                tDict[letter] = 1
            } else {
                tDict[letter]! += 1
            }
        }
        let s = Array(s)

        // int is their index
        var importantLetters = [(Character, Int)]()
        // only store the relevant letters
        var sDict = [Character: Int]()
        var left = 0
        var right = 0
        var answer = [Character]()
        while right < s.count {
            if let tLetterFrequency = tDict[s[right]] {
                // add to sDict 
                if sDict[s[right]] == nil {
                    sDict[s[right]] = 1
                } else {
                    sDict[s[right]]! += 1
                }
                importantLetters.append((s[right], right))

                while !importantLetters.isEmpty && 
                sDict[importantLetters[0].0]! > tDict[importantLetters[0].0]! {
                    sDict[importantLetters[0].0]! -= 1
                    if sDict[importantLetters[0].0]! == 0 {
                        sDict[importantLetters[0].0] = nil
                    }
                    importantLetters.removeFirst()
                }

                // check if a substring exists
                var substringExists = false
                for (letter, tFrequency) in tDict {
                    if let sFrequency = sDict[letter], sFrequency >= tFrequency {
                        substringExists = true
                        // do nothing
                    } else {
                        substringExists = false
                        break
                    }
                }

                if substringExists && (answer.count == 0 || (importantLetters.last!.1 - importantLetters.first!.1 + 1) < answer.count) {
                    answer = Array(s[importantLetters[0].1...importantLetters[importantLetters.count - 1].1])
                }
            }
            right += 1
        }

        return String(answer)
    }
}