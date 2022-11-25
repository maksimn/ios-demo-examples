/*
338. Counting Bits

Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.
*/

class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: n + 1)

        for i in 0..<(n + 1) {
            result[i] = count1s(i)
        }

        return result
    }

    func count1s(_ x: Int) -> Int {
        var x = x
        var count = 0
        var d = 2

        while x > 0 {
            var r = x % d
            x -= r
            d *= 2

            if r > 0 {
                count += 1
            }
        }

        return count
    }
}
