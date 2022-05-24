class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        sentences.map { $0.components(separatedBy: " ") }.max(by: { $0.count < $1.count })!.count
    }
}