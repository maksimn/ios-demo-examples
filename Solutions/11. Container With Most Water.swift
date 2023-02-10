/*
11. Container With Most Water

You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.
*/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        let n = height.count
        var maxLeft = Array(repeating: 0, count: n)
        var maxRight = Array(repeating: 0, count: n)
        let sh = Array(Set(height)).sorted()

        maxLeft[0] = height[0]
        maxRight[n - 1] = height[n - 1]

        for i in 1..<n {
            maxLeft[i] = max(height[i], maxLeft[i - 1])
            maxRight[n - i - 1] = max(height[n - i - 1], maxRight[n - i])
        }

        var mR = maxRight

        mR.reverse()

        var maxs = 0

        for h in sh {
            let i = findLeftInd(maxLeft, h)
            let j = n - 1 - findLeftInd(mR, h)

            if j > i {
                maxs = max(maxs, (j - i) * min(height[i], height[j]))
            }
        }

        return maxs
    }

    func findLeftInd(_ mL: [Int], _ v: Int) -> Int {
        var l = 0, h = mL.count - 1
        var ans = 0

        while l <= h {
            let m = (l + h) / 2

            if mL[m] < v {
                l = m + 1
            } else {
                ans = m
                h = m - 1
            }
        }

        return ans
    }
}
