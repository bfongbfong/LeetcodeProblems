​
class MinStack {
    
    var elements = [Int]()
    var min = Int.max
​
    // logic:
    // keep track of min with a variable.
    // everytime you push. if the new value is lower than min, then push the old min to the stack, and then the new value.
    // update the min variable 
    
    // when you pop the stack. if the popped value is equal to the min, then set the value right underneath it to the new min.
    
​
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        if x <= min {
            elements.append(min)
            min = x
        }
        elements.append(x)
    }
    
    func pop() {
        if let last = elements.last {
            if last == min {
                elements.removeLast()
                min = elements.last!
                elements.removeLast()
            } else {
                elements.removeLast()
            }
        }
    }
    
    func top() -> Int {
        return elements.last ?? -100
    }
    
    func getMin() -> Int {
        return min
    }
}
​
/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
