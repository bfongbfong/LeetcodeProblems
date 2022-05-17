/**
 * The knows API is defined in the parent class Relation.
 *     func knows(_ a: Int, _ b: Int) -> Bool;
 */

class Solution : Relation {
    /*
    person  0.  1.  2
    0       ^
    1
    2
    */
    func findCelebrity(_ n: Int) -> Int {
        var candidate = 0
        for i in 1..<n {
            if knows(candidate, i) {
                candidate = i
            }
        }

        for i in 0..<n {
            if (i != candidate && knows(candidate, i)) || !knows(i, candidate) {
                return -1
            }
        }
        return candidate
    }
}