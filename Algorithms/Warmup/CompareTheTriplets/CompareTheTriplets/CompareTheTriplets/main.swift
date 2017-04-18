//
//  main.swift
//  CompareTheTriplets
//
//  Created by dev on 18/04/2017.
//  Copyright © 2017 easy. All rights reserved.
//

import Foundation

var input = readLine()
let alicePoints = input!.components(separatedBy: " ")

input = readLine()
let bobPoints = input!.components(separatedBy: " ")

var aliceComparisonScore = 0
var bobComparisonScore = 0

for (index,score) in alicePoints.enumerated(){
    let aliceScore = Int(score)!
    let bobScore = Int(bobPoints[index])!
    if aliceScore > bobScore {
        aliceComparisonScore = aliceComparisonScore + 1
    } else if bobScore > aliceScore {
        bobComparisonScore = bobComparisonScore + 1
    }
}

print("\(aliceComparisonScore) \(bobComparisonScore)")
