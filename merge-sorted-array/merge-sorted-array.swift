class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var firstIndex = m - 1
        var secondIndex = n - 1
        
        for i in stride(from: m + n - 1, through: 0, by: -1) {
            if secondIndex < 0 {
                break
            }
            if firstIndex >= 0 && nums1[firstIndex] > nums2[secondIndex] {
                nums1[i] = nums1[firstIndex]
                firstIndex -= 1
            } else {
                nums1[i] = nums2[secondIndex]
                secondIndex -= 1
            }
        }
    }
}
