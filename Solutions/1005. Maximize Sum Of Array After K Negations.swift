/*
1005. Maximize Sum Of Array After K Negations

Given an integer array nums and an integer k, modify the array in the following way:

choose an index i and replace nums[i] with -nums[i].
You should apply this process exactly k times. You may choose the same index i multiple times.

Return the largest possible sum of the array after modifying it in this way.
*/

class Solution {
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var mk = k
        var negativeNums = nums.filter { $0 < 0 }.sorted()
        var positiveNums = nums.filter { $0 > 0 }
        let containsZero = nums.contains(0)
        let nn = negativeNums.count

        for num in negativeNums {
            if mk > 0 {
                mk -= 1
                positiveNums.append(-num)
            } else {
                sum += num
            }
        }

        positiveNums.sort()

        if containsZero {
            mk = 0
        }

        for num in positiveNums {
            if mk > 0 && mk % 2 == 1 {
                sum -= num
                mk = 0
            } else {
                sum += num
            }
        }
        
        return sum
    }
}
