/*
509. Fibonacci Number

Given n, calculate F(n).
*/

class Solution {
    var cache: [Int] = []

    func fib(_ n: Int) -> Int {
        if n < 1 { return 0 }
        if n == 1 { return 1 }

        if cache.isEmpty {
            cache = Array(repeating: 0, count: n + 1)
            cache[1] = 1
        }
        
        if cache[n] != 0 {
            return cache[n]
        }

        let a = cache[n - 2] != 0 ? cache[n - 2] : fib(n - 2)
        let b = cache[n - 1] != 0 ? cache[n - 1] : fib(n - 1)
        let res = a + b

        cache[n - 2] = a
        cache[n - 1] = b
        cache[n] = res

        return res
    }
}
