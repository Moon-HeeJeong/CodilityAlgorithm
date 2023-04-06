
//:> ## FrogRiverOne ##
//:>
//:> A small frog wants to get to the other side of a river. The frog is initially located on one bank of the river (position 0) and wants to get to the opposite bank (position X+1). Leaves fall from a tree onto the surface of the river.


/*:>
 You are given an array A consisting of N integers representing the falling leaves. A[K] represents the position where one leaf falls at time K, measured in seconds.

 The goal is to find the earliest time when the frog can jump to the other side of the river. The frog can cross only when leaves appear at every position across the river from 1 to X (that is, we want to find the earliest moment when all the positions from 1 to X are covered by leaves). You may assume that the speed of the current in the river is negligibly small, i.e. the leaves do not change their positions once they fall in the river.

 For example, you are given integer X = 5 and array A such that:

    A[0] = 1
    A[1] = 3
    A[2] = 1
    A[3] = 4
    A[4] = 2
    A[5] = 3
    A[6] = 5
    A[7] = 4
 
 In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.

 Write a function:

 class Solution { public int solution(int X, int[] A); }
 that, given a non-empty array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.

 If the frog is never able to jump to the other side of the river, the function should return −1.

 For example, given X = 5 and array A such that:

    A[0] = 1
    A[1] = 3
    A[2] = 1
    A[3] = 4
    A[4] = 2
    A[5] = 3
    A[6] = 5
    A[7] = 4
 
 the function should return 6, as explained above.

 Write an efficient algorithm for the following assumptions:

 N and X are integers within the range [1..100,000];
 each element of array A is an integer within the range [1..X].
 */

//: 🌱solutionA (45%)
//while을 저렇게 돌리면 이동하지 못하는 경우(-1) 에는 무한 while이 된다
public func solution(_ X : Int, _ A : inout [Int]) -> Int{
    var destinationPos = -1
    
    var stepArr: [Int] = Array(1...X)
    print(stepArr)
    
    var i = 0
    
    while stepArr.count > 0{
        print("currnet stepArr \(stepArr) input \(A[i]) remove \(stepArr.filter({$0 == A[i]}))")
        
        stepArr.removeAll(where: {$0 == A[i]})
        
        if stepArr.count <= 0{
            print("can cross the river!! \(i)")
            destinationPos = i
        }
        i += 1
    }
    return destinationPos
}

//var leafArr = [1,3,1,4,2,3,5,4]
//var leafArr = [1,1,1,1,1,1,1,1]
//print(solution(5, &leafArr))

//: 🌱solutionB (81%)
//O(N). 큰 값은 타임아웃
public func solutionB(_ X : Int, _ A : inout [Int]) -> Int{
    var destinationPos = -1
    
    var stepArr: [Int] = Array(1...X)
    
    for i in 0..<A.count{
        
        guard stepArr.count > 0 else{
            return destinationPos
        }
        
        if stepArr.count > 0 {
            stepArr.removeAll(where: {$0 == A[i]})
            destinationPos = stepArr.count <= 0 ? i : -1
        }
    }
    return destinationPos
}

var leafArr = [1,3,1,4,2,3,5,4]
//var leafArr = [1,1,1,1,1,1,1,1]
print(solutionB(5, &leafArr))

//: 🌱solutionC (100%)
//Set은 Hashable을 상속받기 때문에 시간복잡도가 낮다.
public func solutionC(_ X : Int, _ A : inout [Int]) -> Int{
    var destinationPos = -1
    
    var stepArr = Set<Int>()
    
    for i in 0..<A.count{
        guard stepArr.count < X else{
            return destinationPos
        }
        
        stepArr.insert(A[i])
        
        if stepArr.count == X{
            destinationPos = i
        }
    }
    return destinationPos
}

//var leafArr = [1,3,1,4,2,3,5,4]
//var leafArr = [1,1,1,1,1,1,1,1]
//print(solutionC(5, &leafArr))

//: 🌱solutionD (100%)
//solutionB를 set 방식으로 구현
public func solutionD(_ X : Int, _ A : inout [Int]) -> Int{
    var destinationPos = -1
    
    var stepArr: Set<Int> = Set(1...X)
    
    for i in 0..<A.count{
        guard stepArr.count > 0 else{
            return destinationPos
        }
        
        stepArr.remove(A[i])
        destinationPos = stepArr.count <= 0 ? i : -1
    }
    return destinationPos
}

