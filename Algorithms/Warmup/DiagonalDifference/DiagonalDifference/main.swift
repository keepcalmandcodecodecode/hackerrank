//
//  main.swift
//  DiagonalDifference
//
//  Created by developer on 4/20/17.
//  Copyright © 2017 developer. All rights reserved.
//

import Foundation

import Foundation

// read the integer n
let n = Int(readLine()!)!

// declare 2d array
var arr: [[Int]] = []

// read array row-by-row
for _ in 0..<n {
    arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
}

var primarySum = 0
var secondarySum = 0

for (rowIndex, rowArray) in arr.enumerated() {
    for (columnIndex, columnElement) in rowArray.enumerated() {
        if rowIndex == columnIndex {
            primarySum = primarySum + columnElement
        }
        if (rowIndex + columnIndex)==(rowArray.count-1) {
            secondarySum = secondarySum + columnElement
        }
    }
}

let difference = abs(primarySum - secondarySum)
print("\(difference)")
