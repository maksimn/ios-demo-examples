/*
110. Balanced Binary Tree

Given a binary tree, determine if it is height-balanced.
*/

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        if !isHeightBalanced(root) { return false }

        return isBalanced(root.left) && isBalanced(root.right)
    }

    func isHeightBalanced(_ node: TreeNode?) -> Bool {
        guard let node = node else { return true }

        return abs(maxDepth(node.right) - maxDepth(node.left)) <= 1
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        return visit(root, 0)
    }

    func visit(_ node: TreeNode?, _ h: Int) -> Int {
        guard let node = node else { return h }

        return max(visit(node.left, h + 1), visit(node.right, h + 1))
    }
}
