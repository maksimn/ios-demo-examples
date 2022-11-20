/*
141. Linked List Cycle

Given head, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

Return true if there is a cycle in the linked list. Otherwise, return false.
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
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
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let head = head else { return false }

        var nodes = Set<ListNode>()
        var node = head

        nodes.insert(head)

        while node.next != nil {
            guard let current = node.next else { break }

            if nodes.contains(current) {
                return true
            } else {
                nodes.insert(current)
            }

            node = current
        }

        return false
    }
}
