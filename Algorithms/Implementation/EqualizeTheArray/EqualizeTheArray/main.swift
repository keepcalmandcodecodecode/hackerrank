//
//  main.swift
//  EqualizeTheArray
//
//  Created by Developer on 29/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the equalizeArray function below.
func equalizeArray(arr: [Int]) -> Int {
    let dict = arr.reduce([Int: Int]()) { dict, num in
        var dict = dict
        if let count = dict[num] {
            dict[num] = count + 1
        } else {
            dict[num] = 1
        }
        return dict
    }
    let allValues = dict.values.sorted(by: { $0 > $1 })
    let maxCount = allValues[0]
    return arr.count - maxCount
}

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

let result = equalizeArray(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
