
class Logger {

    var messages: [String: Int]
    init() {
        self.messages = [:]
    }
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        guard let prevTimeStamp = messages[message] else {
            messages[message] = timestamp
            return true
        }
        if timestamp - prevTimeStamp >= 10 { 
            messages[message] = timestamp
            return true
        } else {
            return false
        }
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */