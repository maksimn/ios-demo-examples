/*
746. Min Cost Climbing Stairs

You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.
*/

class Solution {
    var cache: [Int] = []
    let maxValue = Int.max

    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        cache = Array(repeating: maxValue, count: cost.count)
        return min(minCostClimbingStairs(cost, 0),
                   minCostClimbingStairs(cost, 1))
    }

    func minCostClimbingStairs(_ cost: [Int], _ i: Int) -> Int {
        if i >= cost.count {
            return 0
        } else if i >= cost.count - 2 {
            return cost[i]
        }

        if cache[i] != maxValue { return cache[i] }

        let val1 = minCostClimbingStairs(cost, i + 1)
        let val2 = minCostClimbingStairs(cost, i + 2)
        let ans = cost[i] + min(val1, val2)

        cache[i] = ans

        return ans
    }
}
