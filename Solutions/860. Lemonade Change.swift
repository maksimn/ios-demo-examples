/*
860. Lemonade Change

At a lemonade stand, each lemonade costs $5. Customers are standing in a queue to buy from you and order one at a time (in the order specified by bills). Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill. You must provide the correct change to each customer so that the net transaction is that the customer pays $5.

Note that you do not have any change in hand at first.

Given an integer array bills where bills[i] is the bill the ith customer pays, return true if you can provide every customer with the correct change, or false otherwise.
*/

class Solution {
    var wallet = [0, 0]

    func lemonadeChange(_ bills: [Int]) -> Bool {
        for bill in bills {
            if bill == 5 {
                wallet[0] += 1
            } else if bill == 10 {
                if wallet[0] == 0 {
                    return false
                } else {
                    wallet[0] -= 1
                    wallet[1] += 1
                }
            } else {
                if !handle20Bill() {
                    return false
                }
            }
        }

        return true
    }

    func handle20Bill() -> Bool {
        if wallet[1] > 0 && wallet[0] > 0 {
            wallet[0] -= 1
            wallet[1] -= 1
            return true
        } else if wallet[0] > 2 {
            wallet[0] -= 3
            return true
        }

        return false
    }
}
