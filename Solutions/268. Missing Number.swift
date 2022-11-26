/*
268. Missing Number

Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
*/

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        var nums = nums

        nums.sort()

        for i in 0..<(n + 1) {
            if binarySearch(nums, i) < 0 {
                return i
            }
        }

        return 0
    }

    func binarySearch(_ nums: [Int], _ x: Int) -> Int {
        var l = 0, h = nums.count - 1

        while l <= h {
            let m = (l + h) / 2

            if nums[m] < x {
                l = m + 1
            } else if nums[m] > x {
                h = m - 1
            } else {
                return m
            }
        }

        return -1
    }
}
