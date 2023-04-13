//:> ## PassingCars ##
//:>
//:> A non-empty array A consisting of N integers is given. The consecutive elements of array A represent consecutive cars on a road.
/*:>
 Array A contains only 0s and/or 1s:

 0 represents a car traveling east,
 
 1 represents a car traveling west.
 
 The goal is to count passing cars. We say that a pair of cars (P, Q), where 0 ≤ P < Q < N, is passing when P is traveling to the east and Q is traveling to the west.

 For example, consider array A such that:

    A[0] = 0
    A[1] = 1
    A[2] = 0
    A[3] = 1
    A[4] = 1
 
 We have five pairs of passing cars: (0, 1), (0, 3), (0, 4), (2, 3), (2, 4).

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 
 that, given a non-empty array A of N integers, returns the number of pairs of passing cars.

 The function should return −1 if the number of pairs of passing cars exceeds 1,000,000,000.

 For example, given:

    A[0] = 0
    A[1] = 1
    A[2] = 0
    A[3] = 1
    A[4] = 1
 
 the function should return 5, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 
 each element of array A is an integer that can have one of the following values: 0, 1.
 */

//: 🌱solutionA (100%)
public func solutionA(_ A : inout [Int]) -> Int{
    
    var pairCount = 0
    var zeroCount = 0
    
    for i in 0..<A.count{
        
        guard pairCount < 1000000000 else{ //Int.max
            return -1
        }
        
        if A[i] == 1{
            pairCount += 1*zeroCount
        }else{
            zeroCount += 1
        }
    }
    return pairCount
}

var passingCarsArr = [0,1,0,1,1]
print(solutionA(&passingCarsArr))

//:> ## CountDiv ##
//:>
/*:>
 Write a function:

 public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int

 that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K, i.e.:

 { i : A ≤ i ≤ B, i mod K = 0 }

 For example, for A = 6, B = 11 and K = 2, your function should return 3, because there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.

 Write an efficient algorithm for the following assumptions:

 A and B are integers within the range [0..2,000,000,000];
 
 K is an integer within the range [1..2,000,000,000];
 
 A ≤ B.
 */

//: 🌱solutionB (37%)
// (11, 345, 17) 넣으면..... 답이 잘못 나온다... if가 더 필요할까
public func solutionB(_ A : Int, _ B : Int, _ K : Int) -> Int{
    
    var array = Set(A...B)
    var divisibleCount = array.count/K
    
    if array.count%K == 0 {
        print("not divede")
    }else if (array.max() ?? 0)%K == 0{
        print("last value\(array.max()) is divide +1")
        divisibleCount += 1
    }
    else{
        print("last value\(array.max()) can not divede")
    }
    
    print(array)
    return divisibleCount
}

//: 🌱solutionB (50%)
//O(B-A) 타임아웃~~~ for문을 아예 돌리면 안되나

public func solutionC(_ A : Int, _ B : Int, _ K : Int) -> Int{
    
    let array = Set(A...B)
    
    let aa = array.filter { value in
        value%K == 0
    }
    print(aa)
    return aa.count
}

//: 🌱solutionC (100%)
//O(1)
//solutionB 에서는 B-A 의 카운트를 계산 했는데
//그게 아니라 0부터 B, 0부터 A를 계산 해야함
public func solutionD(_ A : Int, _ B : Int, _ K : Int) -> Int{
    
    let zeroToA = A/K
    let zeroToB = B/K
    var divisibleCount = 0
    
    if A%K == 0{
        divisibleCount = zeroToB - (zeroToA - 1)
    }else{
        divisibleCount = zeroToB - zeroToA
    }
    return divisibleCount
}


//print(solutionD(11, 14, 2))
//print(solutionD(10, 24, 5))
print(solutionD(11, 345, 17))
