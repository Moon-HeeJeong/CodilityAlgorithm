
//:> ## FrogJmp ##
//:>
//:> A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.
/*:>
Count the minimal number of jumps that the small frog must perform to reach its target.

Write a function:
 
public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int
 
that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.

For example, given:

    X = 10
    Y = 85
    D = 30
 
the function should return 3, because the frog will be positioned as follows:

    after the first jump, at position 10 + 30 = 40
    after the second jump, at position 10 + 30 + 30 = 70
    after the third jump, at position 10 + 30 + 30 + 30 = 100
 
Write an efficient algorithm for the following assumptions:

    X, Y and D are integers within the range [1..1,000,000,000];
    X ≤ Y.
*/

import Foundation

//: 🌱solutionA (55%)
// while 문에서 타임아웃
public func solutionA(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    var currentPos = X
    let destinationPos = Y
    let movingPos = D

    var movingCount: Int = 0

    while currentPos < destinationPos{
        print("current \(currentPos) jump \(movingPos)")
        currentPos += movingPos
        movingCount += 1
    }
    return movingCount
}
print(solutionA(10, 85, 30))
print(solutionA(10, 100000, 10))


//: 🌱solutionB  (100%)
public func solutionB(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    let currentPos:Double = Double(X)
    let destinationPos:Double = Double(Y)
    let movingPos = Double(D)
    
    var moving: Double = (destinationPos - currentPos)/movingPos
    print("moving \(moving)")
    
    var movingCount: Int = Int(ceil(moving))
    return movingCount
}

print(solutionB(10, 85, 30))
print(solutionB(10, 100000, 10))
