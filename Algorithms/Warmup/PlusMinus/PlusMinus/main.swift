//
//  main.swift
//  PlusMinus
//
//  Created by developer on 12/28/18.
//  Copyright © 2018 developer. All rights reserved.
//

import Foundation

// Complete the plusMinus function below.
func plusMinus(arr: [Int]) -> Void {
    var positivesCount = 0
    var negativesCount = 0
    var zerosCount = 0
    let count = arr.count
    for item in arr {
        if item > 0 {
            positivesCount = positivesCount + 1
        } else if item < 0 {
            negativesCount = negativesCount + 1
        } else {
            zerosCount = zerosCount + 1
        }
    }
    let positivesFraction = Float(positivesCount)/Float(count)
    let negativesFraction = Float(negativesCount)/Float(count)
    let zerosFraction = Float(zerosCount)/Float(count)
    let positivesFractionString = String(format: "%.6f", positivesFraction)
    let negativesFractionString = String(format: "%.6f", negativesFraction)
    let zerosFractionString = String(format: "%.6f", zerosFraction)
    print("\(positivesFractionString)")
    print("\(negativesFractionString)")
    print("\(zerosFractionString)")
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)

