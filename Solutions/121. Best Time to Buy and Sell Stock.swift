/*
121. Best Time to Buy and Sell Stock

You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
*/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var currentMax = 0
        var maxProfit = 0

        for i in 0..<(n - 1) {
            let j = n - 1 - i
            let price = prices[j]

            currentMax = max(price, currentMax)
            maxProfit = max(maxProfit, currentMax - prices[j - 1])
        }

        return maxProfit
    }
}
