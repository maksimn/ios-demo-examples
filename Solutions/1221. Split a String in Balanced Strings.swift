/*
1221. Split a String in Balanced Strings

Balanced strings are those that have an equal quantity of 'L' and 'R' characters.

Given a balanced string s, split it into some number of substrings such that:

Each substring is balanced.

Return the maximum number of balanced strings you can obtain.
*/

class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        let s = Array(s)
        var rCount = 0, lCount = 0, result = 0

        for ch in s {
            if ch == "L" {
                lCount += 1
            } else if ch == "R" {
                rCount += 1
            }

            if lCount == rCount {
                lCount = 0
                rCount = 0
                result += 1
            }
        }

        return result
    }
}
