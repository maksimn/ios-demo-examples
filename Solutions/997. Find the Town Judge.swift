/*
997. Find the Town Judge

In a town, there are n people labeled from 1 to n. There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

The town judge trusts nobody.
Everybody (except for the town judge) trusts the town judge.
There is exactly one person that satisfies properties 1 and 2.
You are given an array trust where trust[i] = [ai, bi] representing that the person labeled ai trusts the person labeled bi.

Return the label of the town judge if the town judge exists and can be identified, or return -1 otherwise.
*/

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        if n == 1 { return 1 }
        let peopleWhoTrustNobody = findPeopleWhoTrustNobody(n, trust)
        let peopleWhoBeTrustedByEverybody =
            findPeopleWhoBeTrustedByEverybody(n, trust)
        let townJudges = peopleWhoTrustNobody
            .intersection(peopleWhoBeTrustedByEverybody)

        guard townJudges.count == 1 else { return -1 }
        guard let townJudge = townJudges.first else { return -1 }

        return townJudge
    }

    func findPeopleWhoTrustNobody(_ n: Int, _ trust: [[Int]]) -> Set<Int> {
        let believers = Set<Int>(trust.map { $0[0] })

        return Set(1..<(n + 1)).subtracting(believers)
    }

    func findPeopleWhoBeTrustedByEverybody(_ n: Int, _ trust: [[Int]]) -> Set<Int> {
        var dict: [Int: Set<Int>] = [:]
        for pair in trust {
            if let people = dict[pair[1]] {
                var people = people

                people.insert(pair[0])

                dict[pair[1]] = people
            } else {
                dict[pair[1]] = Set<Int>([pair[0]])
            }
        }

        var result = Set<Int>()

        for (key, val) in dict {
            if val.count == n - 1 {
                result.insert(key)
            }
        }

        return result
    }
}


