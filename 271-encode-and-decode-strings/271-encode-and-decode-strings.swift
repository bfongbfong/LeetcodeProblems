class Codec {
    func encode(_ strs: [String]) -> String {
        strs.joined(separator: "\U0001f62d")
    }
    
    func decode(_ s: String) -> [String] {
        s.components(separatedBy: "\U0001f62d")
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)
*/