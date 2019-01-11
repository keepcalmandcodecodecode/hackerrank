//
//  main.swift
//  BonAppetit
//
//  Created by dev on 11/01/2019.
//  Copyright © 2019 easy. All rights reserved.
//

import Foundation

// Complete the bonAppetit function below.
func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
    let sum = bill.reduce(0, {$0+$1})
    let sumWithoutK = sum - bill[k]
    let overcharge = b - sumWithoutK/2
    if overcharge == 0 {
        print("Bon Appetit")
    } else {
        print("\(overcharge)")
    }
}

guard let nkTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0])
    else { fatalError("Bad input") }

guard let k = Int(nk[1])
    else { fatalError("Bad input") }

guard let billTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let bill: [Int] = billTemp.split(separator: " ").map {
    if let billItem = Int($0) {
        return billItem
    } else { fatalError("Bad input") }
}

guard bill.count == n else { fatalError("Bad input") }

guard let b = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

bonAppetit(bill: bill, k: k, b: b)
