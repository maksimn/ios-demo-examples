/*
561. Array Partition

Given an integer array nums of 2n integers, group these integers into n pairs (a1, b1), (a2, b2), ..., (an, bn) such that the sum of min(ai, bi) for all i is maximized. Return the maximized sum.
*/

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var snums = nums.sorted()
        var result = 0
        var i = 0

        while i < snums.count {
            result += snums[i]

            i += 2
        }

        return result
    }
}
