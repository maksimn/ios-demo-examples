/*
14. Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".
*/
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let shortest = findShortest(strs)

        guard !shortest.isEmpty else { return "" }

        var len = 0

        for i in 0..<shortest.count {
            let ch = shortest[i]

            if haveSame(ch, strs, i) {
                len += 1
            } else {
                break
            }
        }

        return String(shortest.prefix(len))
    }

    func haveSame(_ ch: String, _ strs: [String], _ i: Int) -> Bool {
        for str in strs {
            if ch != str[i] {
                return false
            }
        }

        return true
    }

    func findShortest(_ strs: [String]) -> String {
        if strs.count < 1 {
            return ""
        } else {
            var shortest = strs[0]

            for str in strs {
                if str.count < shortest.count {
                    shortest = str
                }
            }

            return shortest
        }
    }
}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
