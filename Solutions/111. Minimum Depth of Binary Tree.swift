/*
111. Minimum Depth of Binary Tree

Given a binary tree, find its minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

Note: A leaf is a node with no children.
*/

typealias TreeNodeData = (TreeNode, Int)

class Queue {
    private var nodes: [TreeNodeData] = []
    private var headIndex = 0

    func peek() -> TreeNodeData? {
        guard headIndex < nodes.count else { return nil }
        return nodes[headIndex]
    }

    func enqueue(_ n: TreeNodeData) {
        nodes.append(n)
    }

    func dequeue() {
        headIndex += 1
    }

    var size: Int {
        nodes.count - headIndex
    }
}

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let queue = Queue()

        queue.enqueue((root, 1))
        
        while queue.size > 0 {
            guard let nodeData = queue.peek() else { return 0 }

            queue.dequeue()

            if nodeData.0.left == nil && nodeData.0.right == nil {
                return nodeData.1
            }
            
            if let leftNode = nodeData.0.left {
                queue.enqueue((leftNode, nodeData.1 + 1))
            } 
            
            if let rightNode = nodeData.0.right {
                queue.enqueue((rightNode, nodeData.1 + 1))
            }
        }

        return 0
    }
}