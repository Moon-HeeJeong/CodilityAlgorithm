
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
//강제 형변환은 별로 좋은 코드는 아니니까 %를 사용해서 하면 더 좋을듯
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

//:> ## PermMissingElem ##
//:>
//:> An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
/*:>
Your goal is to find that missing element.
 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A, returns the value of the missing element.
 For example, given array A such that:

   A[0] = 2
 
   A[1] = 3
 
   A[2] = 1
 
   A[3] = 5
 
 the function should return 4, as it is the missing element.
 
 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 
 the elements of A are all distinct;
 
 each element of array A is an integer within the range [1..(N + 1)].
 */

var cArray = [2,3,1,5]

//: 🌱solutionC (30%)
// 이중 for문 ㅎㅎ
public func solutionC(_ A : inout [Int]) -> Int{
    
    var missingValue: Int = 0
    for i in 0..<A.count{
        
        if A.filter({$0 == i+1}).count == 0{
            missingValue = i+1
        }
    }
    return missingValue
    
}

print(solutionC(&cArray))

//: 🌱solutionD (100%)
// 빠져있는 값까지 모두 더한 뒤, 입력받은 값에서 뺴주면 빠진 값이 얼만지 알 수 있다(등차수열)
public func solutionD(_ A : inout [Int]) -> Int{
    
    let arrayCount = A.count+1
    let sum = (arrayCount * (arrayCount+1))/2
    let inputArraySum = A.reduce(0, +)
    
    let missingValue = sum - inputArraySum
    
    return missingValue
}
print(solutionD(&cArray))

//: 🌱solutionE (100%)
//해쉬맵으로 서치
public func solutionE(_ A : inout [Int]) -> Int{
    
    var tempArray:[Int:Bool] = [:]
    
    for i in 0..<A.count+1{
        tempArray[i+1] = false
    }
    
    for i in 0..<A.count{
        tempArray.removeValue(forKey: A[i])
    }
    return tempArray.first?.key ?? 0
}

print(solutionE(&cArray))
