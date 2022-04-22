class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var marked = Set<[Int]>()
        /* 
        1. what if a marked point was 0 to begin with? and once you get there, you need to know to restart a cross shape?
        2. how do you get around marking a spot as checked, if you need to traverse through that spot from the perpendicular direction?
        */

        func mark(_ col: Int, _ row: Int, moveUp: Bool = false, moveLeft: Bool = false, moveRight: Bool = false, moveDown: Bool = false) {
            var moveUp = moveUp
            var moveLeft = moveLeft
            var moveRight = moveRight
            var moveDown = moveDown
            if matrix[col][row] != 0 {
                matrix[col][row] = 0
                marked.insert([col, row])
            }
            // if marked.contains([col, row]) { return }
            // if matrix[col][row] == 0 {
            //     // need to prevent it from moving in the opp dir?
            //     moveUp = true
            //     moveLeft = true
            //     moveRight = true
            //     moveDown = true
            // }
            
            // move up 
            if row - 1 >= 0 && moveUp {
                mark(col, row - 1, moveUp: true)
            }
            // move left
            if col - 1 >= 0 && moveLeft {
                mark(col - 1, row, moveLeft: true)
            }
            // move right
            if col + 1 < matrix.count && moveRight {
                mark(col + 1, row, moveRight: true)
            }
            // move down
            if row + 1 < matrix[0].count && moveDown {
                mark(col, row + 1, moveDown: true)
            }
        }
        /*
        it's tricky making sure the 0's I set are not marked. so i just need to keep track of which ones are marked
        0 1 2 0
        3 4 5 2
        1 3 1 5
        
        1  2. 3. 4
        5. 0. 7. 8
        0*10* 11 12 <-  the issue is when the left 0 hits 10, 10 has already been evaluated.
        13 14 15 0
        
        1  0. 3. 4
        0. 0. 0. 0
        0.*0* 11 0
        0. 0. 0. 0
        the problem is one of the spots was marked as 0, but it was originally zero as well, so once it got to it the second time, it didn't know that it should go in all directions
        */
        for col in 0..<matrix.count {
            for row in 0..<matrix[col].count {
                if matrix[col][row] == 0 && !marked.contains([col, row]) {
                    mark(col, row, moveUp: true, moveLeft: true, moveRight: true, moveDown: true)
                }
            }
        }
    }
}