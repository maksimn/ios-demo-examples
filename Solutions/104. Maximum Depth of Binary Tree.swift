/*
104. Maximum Depth of Binary Tree

Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
*/

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        return visit(root, 0)
    }

    func visit(_ node: TreeNode?, _ h: Int) -> Int {
        guard let node = node else { return h }

        return max(visit(node.left, h + 1), visit(node.right, h + 1))
    }
}
