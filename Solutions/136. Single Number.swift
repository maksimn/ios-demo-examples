/*
136. Single Number

Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

You must implement a solution with a linear runtime complexity and use only constant extra space.
*/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var nums = nums

        nums.sort()

        var i = 0

        while i < nums.count {
            if hasTheSameNextElement(i, nums) {
                i += 2
            } else {
                return nums[i]
            }
        }


        return nums[0]
    }

    func hasTheSameNextElement(_ i: Int, _ nums: [Int]) -> Bool {
        if i + 1 < nums.count {
            return nums[i] == nums[i + 1]
        }

        return false
    }
}

// Правильное и элегантное решение - использовать оператор XOR, т.к. он имеет свойство A xor A = 0.
