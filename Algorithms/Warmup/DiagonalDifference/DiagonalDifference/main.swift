//
//  main.swift
//  DiagonalDifference
//
//  Created by developer on 12/28/18.
//  Copyright © 2018 developer. All rights reserved.
//

import Foundation

// Complete the diagonalDifference function below.
func diagonalDifference(arr: [[Int]]) -> Int {
    let count = arr.count
    var leftToRightSum = 0
    var rightToLeftSum = 0
    var rowIndex = 0
    var columnOffset = 0
    while rowIndex < count {
        leftToRightSum = arr[rowIndex][columnOffset] + leftToRightSum
        rightToLeftSum = arr[rowIndex][count-columnOffset-1]+rightToLeftSum
        columnOffset = columnOffset + 1
        rowIndex = rowIndex + 1
    }
    return abs(leftToRightSum - rightToLeftSum)
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let arr: [[Int]] = AnyIterator{ readLine() }.prefix(n).map {
    let arrRow: [Int] = $0.split(separator: " ").map {
        if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arrItem
        } else { fatalError("Bad input") }
    }
    
    guard arrRow.count == n else { fatalError("Bad input") }
    
    return arrRow
}

guard arr.count == n else { fatalError("Bad input") }

let result = diagonalDifference(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
