/*
1323. Maximum 69 Number

You are given a positive integer num consisting only of digits 6 and 9.

Return the maximum number you can get by changing at most one digit (6 becomes 9, and 9 becomes 6).
*/

class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var arr = Array("\(num)")

        for i in 0..<arr.count {
            if arr[i] == "6" {
                arr[i] = "9"
                break
            } 
        }

        return Int(String(arr)) ?? 0
    }
}

