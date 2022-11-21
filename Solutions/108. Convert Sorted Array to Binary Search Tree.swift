/*
108. Convert Sorted Array to Binary Search Tree

Given an integer array nums where the elements are sorted in ascending order, convert it to a 
height-balanced binary search tree.
*/

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return createNode(nums, 0, nums.count - 1)
    }

    func createNode(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        guard end >= start else { return nil }

        let m = (start + end) / 2
        let node = TreeNode(nums[m])
        
        node.left = createNode(nums, start, m - 1)
        node.right = createNode(nums, m + 1, end)

        return node
    }
}
