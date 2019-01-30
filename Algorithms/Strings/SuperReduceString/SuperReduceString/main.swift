//
//  main.swift
//  SuperReduceString
//
//  Created by Developer on 30/01/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the superReducedString function below.
func superReducedString(s: String) -> String {
    var result = ""
    for char in s {
        if result.last == char {
            result.removeLast()
        } else {
            result.append(char)
        }
    }
    if result.count == 0 {
        result = "Empty String"
    }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = superReducedString(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
