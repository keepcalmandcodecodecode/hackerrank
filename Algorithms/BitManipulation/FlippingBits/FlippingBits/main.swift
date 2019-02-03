//
//  main.swift
//  FlippingBits
//
//  Created by developer on 2/3/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the flippingBits function below.
func flippingBits(n: UInt32) -> UInt32 {
    return ~n
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for _ in 1...q {
    guard let n = UInt32((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        else { fatalError("Bad input") }
    
    let result = flippingBits(n: n)
    
    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
