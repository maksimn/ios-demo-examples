/*
160. Intersection of Two Linked Lists

Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.
*/

extension ListNode: Hashable, Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var nodes = Set<ListNode>()
        var current = headA

        while current != nil {
            guard let node = current else { return nil }

            nodes.insert(node)
            current = node.next
        }

        current = headB

        while current != nil {
            guard let node = current else { return nil }

            if nodes.contains(node) {
                return node
            }

            current = node.next
        }

        return nil
    }
}
