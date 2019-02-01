//
//  main.swift
//  AlternatingCharacters
//
//  Created by developer on 1/31/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the alternatingCharacters function below.
func alternatingCharacters(s: String) -> Int {
    var currentChar:Character? = nil
    var removeCount = 0
    for char in s {
        if currentChar == char {
            removeCount += 1
        }
        currentChar = char
    }
    return removeCount
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for qItr in 1...q {
    guard let s = readLine() else { fatalError("Bad input") }
    
    let result = alternatingCharacters(s: s)
    
    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
