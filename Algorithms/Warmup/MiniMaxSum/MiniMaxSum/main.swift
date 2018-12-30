//
//  main.swift
//  MiniMaxSum
//
//  Created by developer on 12/30/18.
//  Copyright © 2018 developer. All rights reserved.
//

import Foundation

func miniMaxSum(array:[Int]) -> [Int] {
    let result = array.reduce((min:0,max:0,sum:0), { result, item in
        var currentResult = result
        if item < currentResult.max || currentResult.max == 0 {
            currentResult.max = item
        }
        if item > currentResult.min || currentResult.min == 0 {
            currentResult.min = item
        }
        currentResult.sum = currentResult.sum + item
        return currentResult
    })
    return [result.sum - result.min, result.sum - result.max]
}

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

let res = miniMaxSum(array: arr)

print("\(res[0]) \(res[1])")
