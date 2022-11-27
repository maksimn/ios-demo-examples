/*
125. Valid Palindrome

A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.
*/

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var i = 0, j = s.count - 1

        while i < j {
            let a = s[i]
            let b = s[j]

            if !isAlphanumeric(a) {
                i += 1 
                continue
            }

            if !isAlphanumeric(b) {
                j -= 1 
                continue
            }

            if a.lowercased() != b.lowercased() {
                return false
            }

            i += 1
            j -= 1
        }

        return true
    }

    func isAlphanumeric(_ ch: Character) -> Bool {
        ch.isLetter || ch.isNumber
    }
}
