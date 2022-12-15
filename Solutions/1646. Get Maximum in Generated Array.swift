/*
1646. Get Maximum in Generated Array

You are given an integer n. A 0-indexed integer array nums of length n + 1 is generated in the following way:

nums[0] = 0
nums[1] = 1
nums[2 * i] = nums[i] when 2 <= 2 * i <= n
nums[2 * i + 1] = nums[i] + nums[i + 1] when 2 <= 2 * i + 1 <= n
Return the maximum integer in the array nums​​​.
*/


class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        guard n > 0 else { return  0 }
        var nums = Array(repeating: 0, count: n + 1)
        var maxValue = 0
        
        for i in 1..<(n + 1) {
            if i == 1 {
                nums[i] = 1
            } else if i % 2 == 0 {
                nums[i] = nums[i / 2]
            } else if i % 2 == 1 {
                let j = i / 2

                nums[i] = nums[j] + nums[j + 1]
            }

            maxValue = max(maxValue, nums[i])
        }

        return maxValue
    }
}
