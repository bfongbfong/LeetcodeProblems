class Solution {
    func countArrangement(_ n: Int) -> Int {
        /*
        2, 1
        2 / 1
        2/ 1

        1, 2, 3 yes
        1, 3, 2: no because 2/3 or 3/2 
        3, 2, 1 = yes
        3, 1, 2 = no because 2/3, 3/2
        2, 1, 3 = yes
        2, 3, 1 = 2/3 3/2 so no
        */
        var answer = 0
        func permutate(_ chosenNumsSet: Set<Int>) {
            if chosenNumsSet.count == n { 
                answer += 1
                return 
            }
            for num in 1...n {
                if !chosenNumsSet.contains(num) {
                    if num % (chosenNumsSet.count + 1) == 0 || (chosenNumsSet.count + 1) % num == 0 {
                        var chosenNumsSet = chosenNumsSet
                        chosenNumsSet.insert(num)
                        permutate(chosenNumsSet)
                    }
                }
            }
        }
        permutate([])
        return answer
    }
}