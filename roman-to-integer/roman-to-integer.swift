class Solution {
    func romanToInt(_ s: String) -> Int {
        // create a dictionary of meanings 
        var dict: [Character: Int] = [
            "I": 1, 
            "V": 5, 
            "X": 10, 
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        var sum = 0
        let chars = Array(s)
        
        for i in 0..<chars.count {
            let letter = chars[i]
            
            guard let num = dict[letter] else {
                print("not a valid roman numeral")
                return -1
            }
            
            if num == 5 || num == 50 || num == 500 {
                sum += num
            } else {
                // peek ahead at next one. if next one is the current * 5 or * 10, then go forward and subtract this one. 
                if i + 1 < chars.count {
                    let nextLetter = chars[i + 1]
                    guard let nextNumber = dict[nextLetter] else { 
                        print("not a valid roman numeral")
                        return -1
                    }
                    
                    if nextNumber == num * 10 || nextNumber == num * 5 {
                        sum -= num
                    } else {
                        sum += num
                    }
                } else {
                    sum += num
                }
            }
        }
        return sum
    }
}
