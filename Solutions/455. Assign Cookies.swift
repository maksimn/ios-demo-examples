/*
455. Assign Cookies

Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie.

Each child i has a greed factor g[i], which is the minimum size of a cookie that the child will be content with; and each cookie j has a size s[j]. If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.
*/

class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var gg = g.sorted()
        var ss = s.sorted()
        var count = 0

        for greed in gg {
            let position = findCookie(ss, greed)
            
            if position > -1 {
                count += 1
                ss.remove(at: position)
            }
        }

        return count
    }
    
    func findCookie(_ ss: [Int], _ greed: Int) -> Int {
        let n = ss.count 

        if n == 0 {
            return -1
        } else if n == 1 {
            return ss[0] >= greed ? 0 : -1
        }

        var l = 0, h = n - 1

        while l <= h {
            let m = (l + h) / 2

            if ss[m] >= greed && (m > 0 ? ss[m - 1] < greed : true) {
                return m
            } else if ss[m] < greed {
                l = m + 1
            } else {
                h = m - 1
            }
        }

        return -1
    }
}
