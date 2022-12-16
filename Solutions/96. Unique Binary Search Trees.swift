/*
96. Unique Binary Search Trees

Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.
*/

class Solution {
    var cache: [Int] = []

    func numTrees(_ n: Int) -> Int {
        cache = Array(repeating: 1, count: n + 1)

        return numTreesAux(n)
    }

    func numTreesAux(_ n: Int) -> Int {
        if cache[n] != 1 {
            return cache[n]
        }

        if n < 1 {
            return 1
        } else if n < 3 {
            return n
        } else {
            var count = 0

            for i in 1..<(n + 1) {
                count += numTreesAux(i - 1) * numTreesAux(n - i)
            }

            cache[n] = count

            return count
        }
    }
}
