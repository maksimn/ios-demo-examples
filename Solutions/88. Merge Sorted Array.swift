/*
88. Merge Sorted Array

You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

Merge nums1 and nums2 into a single array sorted in non-decreasing order.

The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
*/

class Queue {
    private var nums: [Int] = []
    private var k = 0

    func peek() -> Int? {
        guard k < nums.count else { return nil }
        return nums[k]
    }

    func enqueue(_ n: Int) {
        nums.append(n)
    }

    func dequeue() {
        k += 1
    }

    var size: Int {
        nums.count - k
    }
}

class Solution {
    let terminalNumber = 1000000001

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        zeroesToTerminalNumber(&nums1, m, n)

        var i = 0
        var k = 0
        let queue = Queue()

        for b in nums2 {
            while let a = queue.peek(), a < b {
                if nums1[i] != terminalNumber {
                    queue.enqueue(nums1[i])
                }
                nums1[i] = a
                queue.dequeue()
                i += 1
            }

            let L = m + k - queue.size

            i = findPositionFor(b, nums1, L, i)

            if i < m + n {
                if i < L {
                    let a = nums1[i]

                    queue.enqueue(a)
                }

                nums1[i] = b
                i += 1
                k += 1
            }
        }

        while let a = queue.peek() {
            if i < m + n {
                if nums1[i] != terminalNumber {
                    queue.enqueue(nums1[i])
                }
                nums1[i] = a
                queue.dequeue()
                i += 1
            } else { break }
        }
    }

    func findPositionFor(_ b: Int, _ nums1: [Int], _ m1: Int, _ i: Int) -> Int {
        guard i <= m1 else { return i }
        for j in i..<m1 {
            if b < nums1[j] {
                return j
            }
        }

        return m1
    }

    func zeroesToTerminalNumber(_ nums1: inout [Int], _ m: Int, _ n: Int) {
        for i in m..<(m + n) {
            nums1[i] = terminalNumber
        }
    }
}
