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

//:> ## GenomicRangeQuery ##
//:>
//:> A DNA sequence can be represented as a string consisting of the letters A, C, G and T, which correspond to the types of successive nucleotides in the sequence. Each nucleotide has an impact factor, which is an integer. Nucleotides of types A, C, G and T have impact factors of 1, 2, 3 and 4, respectively. You are going to answer several queries of the form: What is the minimal impact factor of nucleotides contained in a particular part of the given DNA sequence?
/*:>
 The DNA sequence is given as a non-empty string S = S[0]S[1]...S[N-1] consisting of N characters. There are M queries, which are given in non-empty arrays P and Q, each consisting of M integers. The K-th query (0 ≤ K < M) requires you to find the minimal impact factor of nucleotides contained in the DNA sequence between positions P[K] and Q[K] (inclusive).

 For example, consider string S = CAGCCTA and arrays P, Q such that:

     P[0] = 2    Q[0] = 4
     P[1] = 5    Q[1] = 5
     P[2] = 0    Q[2] = 6
 
 The answers to these M = 3 queries are as follows:

 The part of the DNA between positions 2 and 4 contains nucleotides G and C (twice), whose impact factors are 3 and 2 respectively, so the answer is 2.
 The part between positions 5 and 5 contains a single nucleotide T, whose impact factor is 4, so the answer is 4.
 The part between positions 0 and 6 (the whole string) contains all nucleotides, in particular nucleotide A whose impact factor is 1, so the answer is 1.
 Write a function:

 public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int]
 that, given a non-empty string S consisting of N characters and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M integers specifying the consecutive answers to all queries.

 Result array should be returned as an array of integers.

 For example, given the string S = CAGCCTA and arrays P, Q such that:

     P[0] = 2    Q[0] = 4
     P[1] = 5    Q[1] = 5
     P[2] = 0    Q[2] = 6
 
 the function should return the values [2, 4, 1], as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 M is an integer within the range [1..50,000];
 each element of arrays P and Q is an integer within the range [0..N - 1];
 P[K] ≤ Q[K], where 0 ≤ K < M;
 string S consists only of upper-case English letters A, C, G, T.

 */
//: 🌱solutionE (62%)
//time out
public func solutionE(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
  var filterdInt: [[Int]] = [[]]
    var minValues: [Int] = []
    
    func strToInt(str: String)-> [Int]{
        var intValues: [Int] = []
        
        for (_,s) in str.enumerated(){
            
            switch s{
            case "A": intValues.append(1)
                break
            case "C": intValues.append(2)
                break
            case "G": intValues.append(3)
                break
            case "T": intValues.append(4)
                break
            default: break
            }
        }
        return intValues
    }
    
    for i in 0..<P.count{
        let startIdx = String.Index(encodedOffset: P[i])
        let lastIdx = String.Index(encodedOffset: Q[i])
        
        let filterdValue : String = String(S[startIdx...lastIdx])
        filterdInt.append(strToInt(str: filterdValue))
    }
    
    
    for i in 0..<filterdInt.count{
        minValues.append(filterdInt[i].min() ?? 0)
    }
    minValues.removeFirst()
    return minValues
}
//var eString = "CAGCCTA"
//var pArray = [2,5,0]
//var qArray = [4,5,6]
//
//print(solutionE(&eString, &pArray, &qArray))

//: 🌱solutionE (100%)
//블로그 보고했다...!  미리 값을 셋팅하고 한다
//타임 안에 하는게 어렵다.....
public func solutionE2(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    
    var result = [Int]()

    var a = [0]
    var c = [0]
    var g = [0]
    
    func haveMin(array arr: [Int], from: Int, to: Int) -> Bool {
        let min = arr[from]
        let max = arr[to+1]
        
        if max - min > 0 {
            return true
        } else {
            return false
        }
        return false
    }
    
    
    for (i, s) in S.enumerated() {
        switch s {
        case "A":
            a.append(a[i]+1)
            c.append(c[i])
            g.append(g[i])
        case "C":
            a.append(a[i])
            c.append(c[i]+1)
            g.append(g[i])
        case "G":
            a.append(a[i])
            c.append(c[i])
            g.append(g[i]+1)
        default:
            a.append(a[i])
            c.append(c[i])
            g.append(g[i])
        }
    }
    
    for i in 0..<P.count {
        if haveMin(array: a, from: P[i], to: Q[i]) {
            result.append(1)
        } else if haveMin(array: c, from: P[i], to: Q[i]) {
            result.append(2)
        } else if haveMin(array: g, from: P[i], to: Q[i]) {
            result.append(3)
        } else {
            result.append(4)
        }
    }
    
    return result
}

//:> ## MinAvgTwoSlice ##
//:>
/*:>
 A non-empty array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P < Q < N, is called a slice of array A (notice that the slice contains at least two elements). The average of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice. To be precise, the average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1).

 For example, array A such that:

     A[0] = 4
     A[1] = 2
     A[2] = 2
     A[3] = 5
     A[4] = 1
     A[5] = 5
     A[6] = 8
 
 contains the following example slices:

     slice (1, 2), whose average is (2 + 2) / 2 = 2;
     slice (3, 4), whose average is (5 + 1) / 2 = 3;
     slice (1, 4), whose average is (2 + 2 + 5 + 1) / 4 = 2.5.
 
 The goal is to find the starting position of a slice whose average is minimal.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given a non-empty array A consisting of N integers, returns the starting position of the slice with the minimal average. If there is more than one slice with a minimal average, you should return the smallest starting position of such a slice.

 For example, given array A such that:

     A[0] = 4
     A[1] = 2
     A[2] = 2
     A[3] = 5
     A[4] = 1
     A[5] = 5
     A[6] = 8
 
 the function should return 1, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−10,000..10,000].

 */

//: 🌱solutionF (100%)
//O(N) 블로그 보고했음 ㅠ  a,b,c,d 일때 (a+b) <= (c+d) 일 때, (a,b)와 (c,d)의 평균은 (a+b) 이상이 된다 를 코드로 풀면 된다...
//2개의 그룹이 작은 값이 되므로 4개인 경우는 고려할 필요가 없어진다..!

public func solutionF(_ A : inout [Int]) -> Int{
    
    var minAvg: Float = Float((A[0] + A[1]))/2.0
    var minIdx: Int = 0
    
    for i in 2..<A.count{
        var avg = Float(A[i-2] + A[i-1] + A[i])/3.0
        if minAvg > avg{
            minAvg = avg
            minIdx = i - 2
        }
        avg = Float(A[i-1] + A[i])/2.0
        if minAvg > avg{
            minAvg = avg
            minIdx = i - 1
        }
    }
    return minIdx
}

var fArray = [4,2,2,5,1,5,8]
print(solutionF(&fArray))
