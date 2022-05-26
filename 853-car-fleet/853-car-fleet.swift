class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        if position.isEmpty { return 0 }
        /*
        (2, 3) (4, 2)
        */
        var cars = [(Int, Int)]()
        for i in 0..<position.count {
            cars.append((position[i], speed[i]))
        }
        cars.sort(by: { $0.0 < $1.0 })

        for i in stride(from: cars.count - 1, through: 0, by: -1) {
            // calculate at what point it would take for two cars to reach final point
            // if it's the same time or if the behind car reaches first, then remove the car behind and increment answer
            // target is 12
            // car is at pos 10, speed 2
            // answer is 
            if i - 1 >= 0 {
                let timeCarInFrontWillReachEnd = (Double(target - cars[i].0) / Double(cars[i].1))
                let timeCarInBackWillReachEnd = (Double(target - cars[i - 1].0) / Double(cars[i - 1].1)) 
                if timeCarInBackWillReachEnd <= timeCarInFrontWillReachEnd {
                    print(timeCarInBackWillReachEnd, timeCarInFrontWillReachEnd)
                    cars.remove(at: i - 1)
                }
            }
        }
        return cars.count
    }
}