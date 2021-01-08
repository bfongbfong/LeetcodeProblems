class Solution {
    func countPrimes(_ n: Int) -> Int {
        var primes = Set<Int>()
        
        var primeNumbers = 0
        
        var i = n - 1
        
        while i > 2 { // 9
            var skip = false
            
            for j in 1...Int(Float(i).squareRoot()) {
                if j == 1 {
                    continue
                }
                if i % j == 0 {
                    skip = true
                    break
                }
            }
            i -= 1
            if skip { continue }
            primeNumbers += 1
        }
        if i == 2 {
            primeNumbers += 1
        }
        return primeNumbers
    }
}
