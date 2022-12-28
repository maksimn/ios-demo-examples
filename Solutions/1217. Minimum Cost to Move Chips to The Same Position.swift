/*
1217. Minimum Cost to Move Chips to The Same Position

We have n chips, where the position of the ith chip is position[i].

We need to move all the chips to the same position. In one step, we can change the position of the ith chip from position[i] to:

position[i] + 2 or position[i] - 2 with cost = 0.
position[i] + 1 or position[i] - 1 with cost = 1.
Return the minimum cost needed to move all the chips to the same position.
*/

class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var positionCount: [Int: Int] = [:]

        for p in position {
            if let val = positionCount[p] {
                positionCount[p] = val + 1
            } else {
                positionCount[p] = 1
            }
        }

        var dict: [Int: Int] = [:]

        for (k, v) in positionCount {
            for (_k, _v) in positionCount {
                if k != _k && abs(k - _k) % 2 == 1 {
                    if let val = dict[k] {
                        dict[k] = val + _v
                    } else {
                        dict[k] = _v
                    }
                }
            }
        }

        if dict.count == 0 {
            return 0
        }

        var result = Int.max

        for (key, value) in dict {
            result = min(result, value)
        }

        return result
    }
}
