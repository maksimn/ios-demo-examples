/*
22. Generate Parentheses

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
*/

class Solution {
    var cache: [Set<String>] = []

    func generateParenthesis(_ n: Int) -> [String] {
        cache = Array(repeating: Set<String>(), count: n)

        return Array(generateParenthesisAux(n))
    }

    func generateParenthesisAux(_ n: Int) -> Set<String> {
        if !cache[n - 1].isEmpty {
            return cache[n - 1]
        }

        if n == 1 {
            cache[0] = Set(["()"])
            return cache[0]
        }

        var resultSet = Set<String>()
        let fn1 = generateParenthesisAux(n - 1)

        for s in fn1 {
            resultSet.insert("(\(s))")
        }

        for i in 1..<(n / 2 + 1) {
            let fi = generateParenthesisAux(i)
            let fni = generateParenthesisAux(n - i)

            for s1 in fni {
                for s2 in fi {
                    resultSet.insert(s1 + s2)
                    resultSet.insert(s2 + s1)
                }
            }
        }
        
        cache[n - 1] = resultSet

        return resultSet
    }
}
