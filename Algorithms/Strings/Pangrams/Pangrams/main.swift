//
//  main.swift
//  Pangrams
//
//  Created by Developer on 30/01/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

import Foundation

// Complete the pangrams function below.
func pangrams(s: String) -> String {
    let stringSet = "abcdefghijklmnopqrstuvwxyz"
    for char in stringSet {
        if !(s.contains(char) || s.contains(String(char).uppercased().first!)) {
            return "not pangram"
        }
    }
    return "pangram"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = pangrams(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
