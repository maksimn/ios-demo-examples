/*
66. Plus One

You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

Increment the large integer by one and return the resulting array of digits.
*/

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        let n = digits.count
        var i = n - 1
        var digits = digits

        while i > -1 {
            if digits[i] < 9 {
                digits[i] += 1
                break
            } else {
                digits[i] = 0
                i -= 1
            }
        }

        if i < 0 {
            digits[0] = 1
            digits.append(0)
        }

        return digits
    }
}

// Runtime: beats 30%, memory: beats 13%.
// Runtime: beats 88%, memory: beats 63%.
