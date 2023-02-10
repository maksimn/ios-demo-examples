/*
226. Invert Binary Tree

Given the root of a binary tree, invert the tree, and return its root.
*/

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        invert(root)

        return root
    }

    func invert(_ node: TreeNode?) {
        guard let node = node else { return }
        let left = node.left

        node.left = node.right
        node.right = left

        invert(node.right)
        invert(node.left)
    }
}
