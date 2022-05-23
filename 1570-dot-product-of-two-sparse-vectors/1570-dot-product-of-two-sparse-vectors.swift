
class SparseVector {
    
    var data: [Int]
    init(_ nums: [Int]) {
        data = nums
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        var prod = 0
        for i in 0..<data.count {
            prod += (data[i] * vec.data[i])
        }
        return prod
    }
}

/**
 * Your SparseVector object will be instantiated and called as such:
 * let v1 = SparseVector(nums1)
 * let v2 = SparseVector(nums2)
 * let ans = v1.dotProduct(v2)
*/