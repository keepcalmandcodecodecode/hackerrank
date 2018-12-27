//
//  main.swift
//  CompareTheTriplets
//
//  Created by dev on 27/12/2018.
//  Copyright © 2018 easy. All rights reserved.
//

import Foundation

// Complete the compareTriplets function below.
func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var aliceScores = 0
    var bobScores = 0
    var index = 0
    while index < a.count {
        if a[index] > b[index] {
            aliceScores = aliceScores + 1
        } else if a[index] < b[index] {
            bobScores = bobScores + 1
        }
        index = index + 1
    }
    return [aliceScores, bobScores]
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == 3 else { fatalError("Bad input") }

guard let bTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let b: [Int] = bTemp.split(separator: " ").map {
    if let bItem = Int($0) {
        return bItem
    } else { fatalError("Bad input") }
}

guard b.count == 3 else { fatalError("Bad input") }

let result = compareTriplets(a: a, b: b)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
