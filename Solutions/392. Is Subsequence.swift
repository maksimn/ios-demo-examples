/*
392. Is Subsequence

Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
*/

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        isSubsequence(s, 0, t, 0)
    }

    func isSubsequence(_ s: String, _ i: Int, _ t: String, _ j: Int) -> Bool {
        let m = s.count
        let n = t.count

        if i >= m { return true }
        if j >= n { return false }

        let a = s.charAt(i)

        for k in j..<n {
            let b = t.charAt(k)

            if a == b {
                return isSubsequence(s, i + 1, t, k + 1)
            }
        }

        return false
    }
}

extension String {

    func charAt(_ i: Int) -> Character {
        self[index(startIndex, offsetBy: i)]
    }
}
