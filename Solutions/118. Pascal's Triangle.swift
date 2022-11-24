/*
118. Pascal's Triangle

Given an integer numRows, return the first numRows of Pascal's triangle.

Example:
Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
*/

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = Array(repeating: [], count: numRows)

        for i in 0..<numRows {
            if i == 0 {
                result[i] = [1]
            } else if i == 1 {
                result[i] = [1, 1]
            } else {
                var arr = Array(repeating: 1, count: i + 1)

                for j in 1..<i {
                    arr[j] = result[i - 1][j - 1] + result[i - 1][j]
                }

                result[i] = arr
            }
        }

        return result
    }
}
