//
//  main.swift
//  CutTheSticks
//
//  Created by developer on 1/21/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the cutTheSticks function below.
func cutTheSticks(arr: [Int]) -> [Int] {
    var sortedArray = arr.sorted()
    var result: [Int] = []
    while sortedArray.count > 0 {
        result.append(sortedArray.count)
        let item = sortedArray.first!
        sortedArray = sortedArray.map({ $0 - item}).filter({ $0 > 0 })
    }
    return result
}

print(cutTheSticks(arr: [5, 4, 4, 2, 2, 8]))

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let result = cutTheSticks(arr: arr)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
