/*
409. Longest Palindrome

Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.
*/

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var dict: [Character: Int] = [:]

        for ch in s {
            if let n = dict[ch] {
                dict[ch] = n + 1
            } else {
                dict[ch] = 1
            }
        }

        var nums: [Int] = []

        for (_, n) in dict {
            nums.append(n)
        }

        var len = 0

        for n in nums {
            len += (n / 2) * 2
            
            if (len % 2 == 0) && (n % 2 == 1) {
                len += 1
            }
        }
        
        return len
    }
}
