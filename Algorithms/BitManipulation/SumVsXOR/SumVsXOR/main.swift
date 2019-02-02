//
//  main.swift
//  SumVsXOR
//
//  Created by developer on 2/2/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

import Foundation

// Complete the sumXor function below.
func sumXor(n: Int) -> Int {
    var count = 0
    for i in 0...n{
        if (i^n) == (i+n) {
            count += 1
        }
    }
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = sumXor(n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
