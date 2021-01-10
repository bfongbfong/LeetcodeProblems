class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // loop through the array
        // for each item, turn the item first into a char array, and then into a char set
        // keep a dictionary: the set of letters, and the index it will be in in the 2d array answer
        
        var answer = [[String]]()
        var dict = [[Character: Int]: Int]()
        
        for word in strs {
            let wordChars = Array(word)
            let dictChars = convertCharArrayToDict(wordChars)
            
            if let index = dict[dictChars] {
                 answer[index].append(word)
            } else {
                dict[dictChars] = answer.count
                answer.append([word])
            }
        }
        
        return answer
    }
    
    func convertCharArrayToDict(_ charArray: [Character]) -> [Character: Int] {
        var dict = [Character: Int]()
        for letter in charArray {
            if dict[letter] == nil {
                dict[letter] = 1
            } else {
                dict[letter]! += 1
            }
        }
        return dict
    }
}
