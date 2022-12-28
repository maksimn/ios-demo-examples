/*
1013. Partition Array Into Three Parts With Equal Sum

Given an array of integers arr, return true if we can partition the array into three non-empty parts with equal sums.

Formally, we can partition the array if we can find indexes i + 1 < j with (arr[0] + arr[1] + ... + arr[i] == arr[i + 1] + arr[i + 2] + ... + arr[j - 1] == arr[j] + arr[j + 1] + ... + arr[arr.length - 1])
*/

class Solution {
    func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
        let n = arr.count
        let sum = arr.reduce(0, +)

        if sum % 3 != 0 { 
            return false 
        }

        let s = sum / 3
        var s1 = 0
        var k = 0

        repeat {
            s1 += arr[k]
            k += 1
        } while s1 != s && k < n

        guard k < n else { return false }
        let i = k - 1
        var s2 = 0

        repeat {
            s2 += arr[k]
            k += 1
        } while s2 != s && k < n

        let j = k

        if i + 1 < j && j < n {
            return true
        }

        return false
    }
}
