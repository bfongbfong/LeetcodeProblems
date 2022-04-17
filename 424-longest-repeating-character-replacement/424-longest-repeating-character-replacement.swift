class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var dict: [Character: Int] = ["A": 0, "B": 0, "C": 0, "D": 0, "E": 0, "F": 0, "G": 0, "H": 0, "I": 0, "J": 0, "K": 0, "L": 0, "M": 0, "N": 0, "O": 0, "P": 0, "Q": 0, "R": 0, "S": 0, "T": 0, "U": 0, "V": 0, "W": 0, "X": 0, "Y": 0, "Z": 0]
        /* 
    
        1. create a hashMap for our window's dictionary
        2. have an answer variable
        3. create left and right pointers for window, both starting at 0
        4. create while loop, while right has no reached the end
        5. for each iteration of the loop, loop through the 26 letters of the alphabet, each one checking how many are in our window,
        find the one with the highest frequency.
        then see if lengthOfWindow - highest frequency of letter >= k
        if not, move left pointer
        if so, then count this as answer
        */        
        var answer = 0
        var leftI = 0
        var rightI = 0
        let chars = Array(s)
        dict[chars[rightI]]! += 1
        while rightI < chars.count {
            var mostCommonLetterFrequency = 0
            for (letter, frequency) in dict {
                mostCommonLetterFrequency = max(mostCommonLetterFrequency, frequency)
            }
            let length = rightI - leftI + 1
            if length - mostCommonLetterFrequency <= k {
                answer = max(answer, length)
                rightI += 1
                if rightI < chars.count {
                    dict[chars[rightI]]! += 1   
                }
            } else {
                dict[chars[leftI]]! -= 1
                leftI += 1
            }
        }
        return answer
    }
}