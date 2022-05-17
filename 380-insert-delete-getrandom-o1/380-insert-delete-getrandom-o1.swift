
class RandomizedSet {
    var set = Set<Int>()
    var indexOf = [Int: Int]()
    var array = [Int]()

    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        // print("insert \(val)")
        if set.contains(val) { return false }
        set.insert(val)
        array.append(val)
        indexOf[val] = array.count - 1
        // print(array)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        // print("remove \(val)")
        if !set.contains(val) { return false }
        set.remove(val)
        let temp = array[indexOf[val]!]
        array[indexOf[val]!] = array[array.count - 1]
        indexOf[array[array.count - 1]] = indexOf[val]!
        array[array.count - 1] = temp
        array.removeLast()
        // print(array)
        return true
    }
    
    func getRandom() -> Int {
        // print("get random")
        let randomIndex = Int.random(in: 0..<array.count)
        return array[randomIndex]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */