
class MinStack {
    /*
    push 1
    push 2
    top
    getMin
    pop
    getMin
    top
    */
    // right number is the min at that point
    var nums = [(Int, Int)]()

    init() {
        
    }
    
    func push(_ val: Int) {
        var min = val
        if let lastMin = nums.last {
            if lastMin.1 < val {
                min = lastMin.1    
            }
        }
        nums.append((val, min))
    }
    
    func pop() {
        if !nums.isEmpty {
            nums.removeLast()   
        }
    }
    
    func top() -> Int {
        if let last = nums.last {
            return last.0
        } else {
            return -1
        }
    }
    
    func getMin() -> Int {
        if let last = nums.last {
            return last.1
        } else {
            return -1
        }
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */