class Solution {
    /*
    6479
    */
    var dict: [Int: String] = [
        1: "I",
        5: "V",
        10: "X",
        50: "L",
        100: "C",
        500: "D",
        1000: "M"
    ]
    func intToRoman(_ num: Int) -> String {
        var answer = ""
        let chars = Array(String(num))
        var num = chars.map { char -> Int in 
                             return Int(String(char)) ?? 0
                            }
        var counter = 0 
        for i in stride(from: num.count - 1, through: 0, by: -1) {
            let modifier = Int(pow(10.0, Double(counter)))
            switch num[i] {
            case 0:
                // multiply the preceding number by 10 
                // num[i - 1] *= 10
                break
            case 1...3:
                for i in 1...num[i] {
                    answer = dict[1 * modifier]! + answer
                }
            case 4:
                answer = dict[1 * modifier]! + dict[5 * modifier]! + answer
            case 5:
                answer = dict[5 * modifier]! + answer
            case 6...8:
                let remainder = num[i] - 5
                for i in 0..<remainder {
                    answer = dict[1 * modifier]! + answer
                }
                answer = dict[5 * modifier]! + answer
            case 9:
                answer = dict[1 * modifier]! + dict[10 * modifier]! + answer
            case 10:
                // answer.insert(dict[10 * modifier]!, at: 0)
                answer = dict[10 * modifier]! + answer
            default:
                break
            }
            print(answer)
            counter += 1
        }
        return answer
    }
}