class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // create a dictionary of dictionaries
        // each key in the dictionary will be another dictionary, but the value will be an array of anagrams
        // for each word, turn it into a dictoinary and add it to the master dictionary
        // loop through each key in the big dictionary, make it a column in the 2d array, the value (the arrays) is the row
        // return that answer
        var masterDictionary = [[Character: Int]: [String]]()
        for wordString in strs {
            let word = Array(wordString)
            var thisDict = [Character: Int]()
            for letter in word {
                if thisDict[letter] == nil {
                    thisDict[letter] = 1
                } else {
                    thisDict[letter]? += 1
                }
            }
            if masterDictionary[thisDict] == nil {
                masterDictionary[thisDict] = [wordString]
            } else {
                masterDictionary[thisDict]?.append(wordString)
            }
        }

        var answer = [[String]]()
        for (_, grouping) in masterDictionary {
            answer.append(grouping)
        }
        return answer
    }
}