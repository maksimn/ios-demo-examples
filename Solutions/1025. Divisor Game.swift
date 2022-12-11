/*
1025. Divisor Game

Alice and Bob take turns playing a game, with Alice starting first.

Initially, there is a number n on the chalkboard. On each player's turn, that player makes a move consisting of:

Choosing any x with 0 < x < n and n % x == 0.
Replacing the number n on the chalkboard with n - x.
Also, if a player cannot make a move, they lose the game.

Return true if and only if Alice wins the game, assuming both players play optimally.
*/

class Solution {
    var cacheA: [Bool?] = []
    var cacheB: [Bool?] = []

    func divisorGame(_ n: Int) -> Bool {
        cacheA = Array(repeating: nil, count: n + 1)
        cacheB = Array(repeating: nil, count: n + 1)

        return divisorGame(n, true) // n - число, true - ход Алисы.
    }

    func divisorGame(_ n: Int, _ flag: Bool) -> Bool {
        if n == 1 { // Условие завершения игры.
            return !flag // Результат игры.
        }
        if flag {
            if let result = cacheA[n] { return result }
        }
        if !flag {
            if let result = cacheB[n] { return result }
        }

        let nums = findDivisors(n)
        var result = !flag

        for num in nums {
            if flag {
                result = result || divisorGame(n - num, !flag)
            } else {
                result = result && divisorGame(n - num, !flag)
            }
        }

        if flag {
            cacheA[n] = result
        } else {
            cacheB[n] = result
        }

        return result
    }

    func findDivisors(_ n: Int) -> [Int] {
        var i = 2
        var result = [1]

        while i * i <= n {
            if n % i == 0 {
                result.append(i)
            }

            i += 1
        }

        return result
    }
}
