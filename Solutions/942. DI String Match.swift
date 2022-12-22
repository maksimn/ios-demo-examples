/*
942. DI String Match

A permutation perm of n + 1 integers of all the integers in the range [0, n] can be represented as a string s of length n where:

s[i] == 'I' if perm[i] < perm[i + 1], and
s[i] == 'D' if perm[i] > perm[i + 1].

Given a string s, reconstruct the permutation perm and return it. If there are multiple valid permutations perm, return any of them.
*/

class Solution {
    var position = 0

    func diStringMatch(_ s: String) -> [Int] {
        let s: [Character] = Array(s)
        let n = s.count
        var result = Array(repeating: -1, count: n + 1)
        var current = 0
        
        while true {
            position = findNextI(s)

            if position == -1 {
                break
            } else {
                result[position] = current
                current += 1
            }

            position += 1
        }

        result[n] = current
        current += 1
        position = n - 1

        while true {
            position = findNextD(s)

            if position == -1 {
                break
            } else {
                result[position] = current
                current += 1
            }

            position -= 1
        }

        return result
    }

    func findNextI(_ s: [Character]) -> Int {
        for j in position..<s.count {
            if s[j] == "I" {
                return j
            }
        }

        return -1
    }

    func findNextD(_ s: [Character]) -> Int {
        var j = position

        while j > -1 {
            if s[j] == "D" {
                return j
            }

            j -= 1
        }

        return -1
    }
}
