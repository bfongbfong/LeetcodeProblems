
class TimeMap {

    var dict = [String: [(String, Int)]]()

    init() {
        
    }
    
    /*
    ["TimeMap","set","set","get","get","get","get","get"]
[[],["love","high",10],["love","low",20],["love",5],["love",10],["love",15],["love",20],["love",25]]
    set - love high 10
    set - love low 20
    get - love 5 = ""    
    get - love 10 = high
    get - love 15 = high    // i have low
    get - love 20 = low
    get - love 25 = low
    */
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if dict[key] == nil {
            dict[key] = [(value, timestamp)] 
        } else {
            // binary search to find its spot

            var left = 0
            var right = dict[key]!.count - 1
            while left <= right {
                let mid = left + ((right - left) / 2)
                if dict[key]![mid].1 == timestamp {
                    dict[key]![mid] = (value, timestamp)
                } 
                else if mid - 1 < 0 && dict[key]![mid].1 > timestamp {
                    // insert at front
                    dict[key]!.insert((value, timestamp), at: 0)
                } else if mid + 1 >= dict[key]!.count && dict[key]![mid].1 < timestamp {
                    // append to back
                    dict[key]!.append((value, timestamp))
                } else if mid - 1 >= 0 && dict[key]![mid - 1].1 < timestamp && dict[key]![mid].1 > timestamp {
                    // if mid is greater than it, and the one to the left is smaller, then insert it there.
                    dict[key]!.insert((value, timestamp), at: mid)
                } else if mid + 1 < dict[key]!.count && dict[key]![mid + 1].1 > timestamp && dict[key]![mid].1 < timestamp {
                    dict[key]!.insert((value, timestamp), at: mid + 1)
                } else if dict[key]![mid].1 > timestamp {
                    // go left
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        if dict[key] == nil { return "" }
        var left = 0
        var right = dict[key]!.count - 1
        while left <= right {
            let mid = left + ((right - left) / 2)
            if dict[key]![mid].1 == timestamp {
                return dict[key]![mid].0
            } else if mid == 0 && dict[key]![mid].1 > timestamp {
                return ""
            } 
                            // if it doesn't exist, get the largest timestamp that's smaller than it
            else if dict[key]![mid].1 > timestamp && mid - 1 >= 0 && dict[key]![mid - 1].1 < timestamp {
                return dict[key]![mid - 1].0
            }
            else if dict[key]![mid].1 > timestamp {
                // go left
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return dict[key]!.last!.0
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */