
class SparseVector {
    
    var data: [Int: Int]
    // index: value (that is not zero)
    init(_ nums: [Int]) {
        data = [:]
        for i in 0..<nums.count {
            if nums[i] != 0 {
                data[i] = nums[i]
            }
        }
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        var prod = 0
        for (key, val) in data {
            if let vecValue = vec.data[key] {
                prod += (vecValue * val)
            }
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