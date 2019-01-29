//
//  main.swift
//  CamelCase
//
//  Created by developer on 1/28/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the camelcase function below.
func camelcase(s: String) -> Int {
    var count = 1
    for char in s {
        if String(char).uppercased() == String(char) {
            count += 1
        }
    }
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = camelcase(s: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
