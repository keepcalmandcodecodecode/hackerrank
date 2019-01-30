//
//  main.swift
//  MarsExploration
//
//  Created by Developer on 30/01/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the marsExploration function below.

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

func marsExploration(s: String) -> Int {
    let pattern = "SOS"
    var errorsCount = 0
    var patternPointer = 0
    for char in s {
        if char != pattern[patternPointer] {
            errorsCount += 1
        }
        patternPointer += 1
        if patternPointer >= pattern.count {
            patternPointer = 0
        }
    }
    return errorsCount
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = marsExploration(s: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
