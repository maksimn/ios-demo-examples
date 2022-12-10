/*
53. Maximum Subarray

Given an integer array nums, find the subarray which has the largest sum and return its sum.
*/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.allSatisfy({ $0 <= 0 }) {
            return nums.max() ?? Int.min
        }
        let n = nums.count
        var dist = Array(repeating: 0, count: n)

        dist[0] = nums[0]

        for i in 1..<n {
            dist[i] = dist[i - 1] + nums[i]
        }

        return findMaxSum(dist, nums)
    }

    func findMaxSum(_ sums: [Int], _ nums: [Int]) -> Int {
        let n = sums.count
        guard n > 1 else { return nums[0] }
        var y = Int.min
        var mins = Array(repeating: 0, count: n)
        var maxs = Array(repeating: 0, count: n)

        for i in 0..<n {
            if i == 0 {
                mins[0] = sums[0] - nums[i]
                maxs[n - 1] = sums[n - 1]
            } else {
                mins[i] = min(mins[i - 1], sums[i] - nums[i])
                maxs[n - 1 - i] = max(maxs[n - i], sums[n - 1 - i])
            }
        }

        for i in 0..<n {
            y = max(y, maxs[i] - mins[i])
        }

        return y
    }
}
