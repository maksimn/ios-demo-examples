/*
70. Climbing Stairs

You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
*/

class Solution {
    var cache: [Int] = []

    func climbStairs(_ n: Int) -> Int {
        if cache.count == 0 {
            cache = Array(repeating: -1, count: n + 1)
        }

        if n < 4 {
            if cache[n] < 0 {
                cache[n] = n
            }

            return n
        } else {
            if cache[n] < 0 {
                if cache[n - 2] < 0 {
                    let res = climbStairs(n - 2)

                    cache[n - 2] = res
                }

                if cache[n - 1] < 0 {
                    let res = climbStairs(n - 1)

                    cache[n - 1] = res
                }

                return cache[n - 2] + cache[n - 1]
            } else {
                return cache[n]
            }
        }
    }
}
