/*
976. Largest Perimeter Triangle

Given an integer array nums, return the largest perimeter of a triangle with a non-zero area, formed from three of these lengths. If it is impossible to form any triangle of a non-zero area, return 0.
*/

class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted { $0 > $1 }
        let n = nums.count
        
        for i in 0..<(n - 2) {
            if nums[i] < nums[i + 1] + nums[i + 2] {
                return nums[i] + nums[i + 1] + nums[i + 2]
            }
        }

        return 0
    }
}
