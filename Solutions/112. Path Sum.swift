/*
112. Path Sum

Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

A leaf is a node with no children.
*/

class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        hasPathSum(root, 0, targetSum)
    }

    func hasPathSum(_ root: TreeNode?, _ sum: Int, _ targetSum: Int) -> Bool {
        guard let node = root else {
            return false
        }
        let sum = sum + node.val

        if node.right == nil && node.left == nil {
            return sum == targetSum
        }
        
        return hasPathSum(node.right, sum, targetSum) || 
            hasPathSum(node.left, sum, targetSum)
    }
}
