//
//  main.swift
//  BreakingTheRecords
//
//  Created by developer on 12/31/18.
//  Copyright © 2018 developer. All rights reserved.
//

import Foundation

// Complete the breakingRecords function below.
func breakingRecords(scores: [Int]) -> [Int] {
    var startResult: (max: Int, min: Int, maxChangeCount: Int, minChangeCount: Int) = (max: scores[0], min: scores[0], maxChangeCount: 0, minChangeCount: 0)
    startResult = scores.reduce(startResult, { currentResult, item in
        var result = currentResult
        if item > result.max {
            result.max = item
            result.maxChangeCount = result.maxChangeCount + 1
        }
        if item < result.min {
            result.min = item
            result.minChangeCount = result.minChangeCount + 1
        }
        return result
    })
    return [startResult.maxChangeCount, startResult.minChangeCount]
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let scoresTemp = readLine() else { fatalError("Bad input") }
let scores: [Int] = scoresTemp.split(separator: " ").map {
    if let scoresItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoresItem
    } else { fatalError("Bad input") }
}

guard scores.count == n else { fatalError("Bad input") }

let result = breakingRecords(scores: scores)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
