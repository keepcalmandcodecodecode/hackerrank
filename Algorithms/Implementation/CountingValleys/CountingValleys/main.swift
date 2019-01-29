//
//  main.swift
//  CountingValleys
//
//  Created by developer on 1/27/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the countingValleys function below.
func countingValleys(n: Int, s: String) -> Int {
    var count = 0
    var level = 0
    var inValley = false
    for char in s {
        if char == "U" {
            level = level + 1
        } else {
            level = level - 1
        }
        if level < 0 {
            inValley = true
        } else if inValley {
            count = count + 1
            inValley = false
        }
    }
    return count
}

print(countingValleys(n: 8, s: "DDUUDDUDUUUD"))

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let s = readLine() else { fatalError("Bad input") }

let result = countingValleys(n: n, s: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
