
/**
 ## Task1 ##
 
 An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).

 The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.

 Write a function:

 public func solution(_ A : inout [Int], _ K : Int) -> [Int]
 that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.

 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 For another example, given

     A = [0, 0, 0]
     K = 1
 the function should return [0, 0, 0]

 Given

     A = [1, 2, 3, 4]
     K = 4
 the function should return [1, 2, 3, 4]

 Assume that:

 N and K are integers within the range [0..100];
 each element of array A is an integer within the range [−1,000..1,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
 Copyright 2009–2023 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 public func solutionA(_ A : inout [Int], _ K : Int) -> [Int] {
 // Implement your solution here
 }
 **/

import Foundation

var A = [1, 2, 3, 4]
var K = 20


//🌱solutionA (100%)
//for 문이 많아서 solutionB로 다시 작성

var tempArrayA: [Int] = []

for _ in 0..<A.count{
    tempArrayA.append(0)
}
for k in 0..<K{
    for i in 0..<A.count{
        if i < A.count-1{
            tempArrayA[i+1] = A[i]
        }else{
            tempArrayA[0] = A[i]
        }
    }
    
    print("\(k)번째 shift ::\(tempArrayA)")
    A = tempArrayA
}


//🌱solutionB  (100%)
//toTempInx - A.count 했다가 K가 A.count의 2배 이상인 값이 들어올 때 에러가 나서 %로 처리
var tempArrayB = Array<Int>(repeating: 0, count: A.count)

for i in 0..<A.count{
    let toTempInx = i+K
    
    if toTempInx <= A.count-1{
        tempArrayB[toTempInx] = A[i]
    }else{
        tempArrayB[toTempInx%A.count] = A[i]
    }
}
    



