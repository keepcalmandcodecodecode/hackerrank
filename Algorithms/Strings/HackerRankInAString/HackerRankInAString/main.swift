//
//  main.swift
//  HackerRankInAString
//
//  Created by Developer on 01/02/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the hackerrankInString function below.
func hackerrankInString(s: String) -> String {
    let hackerrank = "hackerrank"
    var hackerrankCursor = 0
    for char in s {
        if hackerrankCursor >= hackerrank.count-1 {
            return "YES"
        }
        if char == hackerrank[hackerrank.index(hackerrank.startIndex, offsetBy: hackerrankCursor)] {
            hackerrankCursor += 1
        }
    }
    return "NO"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for _ in 1...q {
    guard let s = readLine() else { fatalError("Bad input") }
    
    let result = hackerrankInString(s: s)
    
    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
