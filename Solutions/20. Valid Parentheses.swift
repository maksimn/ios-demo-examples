/*
20. Valid Parentheses

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.
*/

struct Stack {
    private var storage = [Character]()
    mutating func push(_ element: Character) { storage.append(element)  }
    mutating func pop() -> Character? { storage.popLast() }
    var size: Int { storage.count }
}

class Solution {
    let a: Character = "("
    let b: Character = "{"
    let c: Character = "["
    let aa: Character = ")"
    let bb: Character = "}"
    let cc: Character = "]"

    func isValid(_ s: String) -> Bool {
        guard s.count > 1 else { return false }
        var stack = Stack()

        if !isOpen(s[0]) { return false }

        stack.push(s[0])

        for i in 1..<s.count {
            let ch = s[i]

            if isOpen(ch) {
                stack.push(ch)
            } else {
                guard let prevCh = stack.pop() else { return false }

                if !isClosed(ch, for: prevCh) {
                    return false
                }
            }
        }

        return stack.size == 0
    }

    func isOpen(_ ch: Character) -> Bool {
        ch == a || ch == b || ch == c
    }

    func isClosed(_ ch: Character, for openCh: Character) -> Bool {
        (ch == aa && openCh == a) || 
        (ch == bb && openCh == b) ||
        (ch == cc && openCh == c)
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
