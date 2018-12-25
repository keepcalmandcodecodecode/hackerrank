//
//  main.swift
//  BirthdayCakeCandles
//
//  Created by developer on 12/25/18.
//  Copyright © 2018 developer. All rights reserved.
//

import Foundation

// Complete the birthdayCakeCandles function below.
func birthdayCakeCandles(ar: [Int]) -> Int {
    let result = ar.reduce((max:0, count:0)) { currentResult, item in
        if currentResult.max < item {
            return (item,1)
        } else if currentResult.max == item {
            return (item,currentResult.count+1)
        } else {
            return currentResult
        }
    }
    return result.count
}

print(birthdayCakeCandles(ar: [3,2,1]))

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == arCount else { fatalError("Bad input") }

let result = birthdayCakeCandles(ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

