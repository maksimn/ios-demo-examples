/*
62. Unique Paths

There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

The test cases are generated so that the answer will be less than or equal to 2 * 10^9.
*/

class Solution {
    var cache: [[Int]] = []

    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        cache = Array(repeating: Array(repeating: -1, count: n), count: m)
        return uniquePathsAux(m - 1, n - 1)
    }

    func uniquePathsAux(_ x: Int, _ y: Int) -> Int {
        if cache[x][y] != -1 {
            return cache[x][y]
        }

        if !(x == 0 || y == 0) {
            let result = uniquePathsAux(x - 1, y) + uniquePathsAux(x, y - 1)

            cache[x][y] = result 

            return result
        } else {
            return 1
        }
    }
}
