/*
58. Length of Last Word

Given a string s consisting of words and spaces, return the length of the last word in the string.

A word is a maximal substring consisting of non-space characters only.
*/

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let n = s.count
        var i = n - 1
        var start = -1, end = -1

        while i > -1 {
            if end < 0 && !s.charAt(i).isWhitespace {
                end = i
                i -= 1
                continue
            }

            if end > -1 && s.charAt(i).isWhitespace {
                start = i + 1
                break
            } else if i == 0 {
                start = i
            }

            i -= 1
        }

        if start < 0 {
            start = 0
        }

        return end - start + 1
    }
}

extension String {

    func charAt(_ i: Int) -> Character {
        self[index(startIndex, offsetBy: i)]
    }
}
