
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


//:> ## PermCheck ##
//:>
//:> A non-empty array A consisting of N integers is given. A permutation is a sequence containing each element from 1 to N once, and only once.
/*:>
 For example, array A such that:
 
    A[0] = 4
    A[1] = 1
    A[2] = 3
    A[3] = 2
 
 is a permutation, but array A such that:
 
    A[0] = 4
    A[1] = 1
    A[2] = 3
 
 is not a permutation, because value 2 is missing.
 
 The goal is to check whether array A is a permutation.
 
 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 
 that, given an array A, returns 1 if array A is a permutation and 0 if it is not.
 
 For example, given array A such that:
 
    A[0] = 4
    A[1] = 1
    A[2] = 3
    A[3] = 2
 
 the function should return 1.

 Given array A such that:
 
    A[0] = 4
    A[1] = 1
    A[2] = 3
 
 the function should return 0.

 Write an efficient algorithm for the following assumptions:
 
 N is an integer within the range [1..100,000];
 
 each element of array A is an integer within the range [1..1,000,000,000].
 */
//: 🌱solutionE (75%)
// O(N ** 2) for 문 안에 어레이 필터있음 -> 지양~
public func solutionE(_ A : inout [Int]) -> Int{
    
    for i in 0..<A.count{
        if A.filter({$0 == i+1}).count == 0{
            return 0
        }
    }
    return 1
}
//: 🌱solutionF (100%)
//O(N) or O(N * log(N)) 또 Set
public func solutionF(_ A : inout [Int]) -> Int{
    var tempArr:Set<Int> = Set(1...A.count)
    
    for i in 0..<A.count{
        tempArr.remove(A[i])
    }
    return tempArr.count == 0 ? 1 : 0
}

//var eArray = [4,1,3,2]
var eArray = [4,1,3]
print(solutionF(&eArray))

//:> ## MaxCounters ##
//:>
/*:> You are given N counters, initially set to 0, and you have two possible operations on them:
 
 increase(X) − counter X is increased by 1,
 
 max counter − all counters are set to the maximum value of any counter.
 
 A non-empty array A of M integers is given. This array represents consecutive operations:

 if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
 
 if A[K] = N + 1 then operation K is max counter.
 
 For example, given integer N = 5 and array A such that:

     A[0] = 3
     A[1] = 4
     A[2] = 4
     A[3] = 6
     A[4] = 1
     A[5] = 4
     A[6] = 4
 
 the values of the counters after each consecutive operation will be:

     (0, 0, 1, 0, 0)
     (0, 0, 1, 1, 0)
     (0, 0, 1, 2, 0)
     (2, 2, 2, 2, 2)
     (3, 2, 2, 2, 2)
     (3, 2, 2, 3, 2)
     (3, 2, 2, 4, 2)
 
 The goal is to calculate the value of every counter after all operations.

 Write a function:

 public func solution(_ N : Int, _ A : inout [Int]) -> [Int]
 
 that, given an integer N and a non-empty array A consisting of M integers, returns a sequence of integers representing the values of the counters.

 Result array should be returned as an array of integers.

 For example, given:

     A[0] = 3
     A[1] = 4
     A[2] = 4
     A[3] = 6
     A[4] = 1
     A[5] = 4
     A[6] = 4
 
 the function should return [3, 2, 2, 4, 2], as explained above.

 Write an efficient algorithm for the following assumptions:

 N and M are integers within the range [1..100,000];
 
 each element of array A is an integer within the range [1..N + 1].
 */
/**
 문제 이해가 오래 걸림
 처음에 N만큼 0을 갖는 temp 배열 하나 만들고
 A[i] 가 N 보다 작으면 temp[A[i]] 에 +1
 A[i] 가 N 보다 크면 현재 까지의 최대 값을 temp 어레이 전체에 셋팅 해줌
 **/

//: 🌱solutionG (88%)
//O(N + M)
//for 문 안에서 array repeating 을 해줘서 .... 타임아웃!
public func solutionG(_ N : Int, _ A : inout [Int]) -> [Int]{

    var tempArr = Array<Int>(repeating: 0, count: N)
    var currentMaxCount = 0
    
    for i in 0..<A.count{
        let value = A[i]
        
        if value <= N{
            tempArr[value-1] += 1
            currentMaxCount = max(tempArr[value-1], currentMaxCount)
            print("+1 count \(tempArr)")
        }else{
            tempArr = Array<Int>(repeating: currentMaxCount, count: N)
            print("set max count \(tempArr)")
        }
    }
    return tempArr
}

//var maxCountersArr = [3,4,4,6,1,4,4]
//var maxCountersArr = [6,7,5,2,5,4,2]
//print(solutionG(5, &maxCountersArr))

//: 🌱solutionH (100%)
//O(N + M)
//맥스값 셋팅을 제일 마지막에 for문 돌려서 해줌
public func solutionH(_ N : Int, _ A : inout [Int]) -> [Int]{

    var tempArr = Array<Int>(repeating: 0, count: N)
    var currentMaxCount = 0
    var applyMaxCount = 0
    
    for i in 0..<A.count{
        let value = A[i]
        
        if value <= N{
            if tempArr[value-1] > applyMaxCount {
                tempArr[value-1] += 1
            }else {
                tempArr[value-1] = applyMaxCount + 1
            }
            currentMaxCount = max(tempArr[value-1], currentMaxCount)
        }else{
            applyMaxCount = currentMaxCount
        }
    }
    
    for i in 0..<tempArr.count{
        if tempArr[i] < applyMaxCount{
            tempArr[i] = applyMaxCount
        }
    }
    return tempArr
}

var maxCountersArr = [3,4,4,6,1,4,4]
//var maxCountersArr = [6,7,5,2,5,4,2]
print(solutionH(5, &maxCountersArr))

//:> ## MissingInteger ##
//:>
/*:>
 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

 For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

 Given A = [1, 2, 3], the function should return 4.

 Given A = [−1, −3], the function should return 1.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 
 each element of array A is an integer within the range [−1,000,000..1,000,000].
 */

//: 🌱solutionI (100%)
//O(N) or O(N * log(N))
public func solutionI(_ A : inout [Int]) -> Int{
    
    var availableArr: Set<Int> = Set(1...A.count+1)
    
    for i in 0..<A.count{
        guard availableArr.count > 1 else{
            return availableArr.first ?? 1
        }
        availableArr.remove(A[i])
    }
    return availableArr.min() ?? 1
}
var iArray =  [1, 3, 6, 4, 1, 2]//[-1,-3]
print(solutionI(&iArray))
