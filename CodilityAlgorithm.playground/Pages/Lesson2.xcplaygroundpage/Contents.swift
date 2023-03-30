

//:> ## CyclicRotation ##
//:>
//:> An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
/*:>
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
 
 */

import Foundation

var A = [1, 2, 3, 4]
var K = 20

//: 🌱solutionA (100%)
//for 문이 많아서 solutionB로 다시 작성
public func solutionA(_ A : inout [Int], _ K : Int) -> [Int] {
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
    return A
}
print(solutionA(&A, 4))


//: 🌱solutionB  (100%)
//toTempInx - A.count 했다가 K가 A.count의 2배 이상인 값이 들어올 때 에러가 나서 %로 처리
public func solutionB(_ A : inout [Int], _ K : Int) -> [Int] {
    var tempArrayB = Array<Int>(repeating: 0, count: A.count)
    
    for i in 0..<A.count{
        let toTempInx = i+K
        
        if toTempInx <= A.count-1{
            tempArrayB[toTempInx] = A[i]
        }else{
            tempArrayB[toTempInx%A.count] = A[i]
        }
        
        print("\(tempArrayB)")
    }
    return A
}

print(solutionB(&A, 20))


//:> ## OddOccurrencesInArray ##
//:>
//:> A non-empty array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.
/*:>
 For example, in array A such that:
 
    A[0] = 9  A[1] = 3  A[2] = 9
 
    A[3] = 3  A[4] = 9  A[5] = 7
 
    A[6] = 9
 
 the elements at indexes 0 and 2 have value 9,
 the elements at indexes 1 and 3 have value 3,
 the elements at indexes 4 and 6 have value 9,
 the element at index 5 has value 7 and is unpaired.
 Write a function:
 public func solution(_ A : inout [Int]) -> Int
 that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.
 For example, given array A such that:

    A[0] = 9  A[1] = 3  A[2] = 9
 
    A[3] = 3  A[4] = 9  A[5] = 7
 
    A[6] = 9
 
 the function should return 7, as explained in the example above.
 Write an efficient algorithm for the following assumptions:
 N is an odd integer within the range [1..1,000,000];
 each element of array A is an integer within the range [1..1,000,000,000];
 all but one of the values in A occur an even number of times.
*/

var task2Array: [Int] = [9,3,9,3,9,7,9]

//: 🌱solutionC (66%)
//많은 값이 들어올 때 너무 오래걸림. 시간복잡도가 O(N**2) 으로 나와서 타임아웃
public func solutionC(_ A : inout [Int]) -> Int {
    
    var readyValue: [Int] = []
    
    for i in 0..<A.count{
        
        let targetIdx = readyValue.firstIndex(of: A[i])
        
//        print("\(A[i])값이 들어있는 targetIdx \(targetIdx)")
        
        if let idx = targetIdx{
            readyValue.remove(at: idx)
        }else{
            readyValue.append(A[i])
        }
    }
    return readyValue.first ?? 0
}
print(solutionC(&task2Array))

//: 🌱solutionD (100%)
//시간복잡도를 줄이기 위해 어레이 대신 딕셔너리 사용. 키값으로 바로 찾아온다. O(N) or O(N*log(N))
public func solutionD(_ A : inout [Int]) -> Int {
    
    var readyValue: [Int:Bool] = [:]
    
    for i in 0..<A.count{
        
        let target = readyValue.index(forKey: A[i])
        
//        print("\(A[i])값이 들어있는 target \(target)")
        
        if let target = target{
            readyValue.remove(at: target)
        }else{
            readyValue[A[i]] = false
        }
    }
    return readyValue.first?.key ?? 0
}
print(solutionD(&task2Array))

//: aaa

/*:>
 fffffaaaa
 */

//:> memoddad
//:>ddfsdfsd

//:#  fffff

/* fff */


