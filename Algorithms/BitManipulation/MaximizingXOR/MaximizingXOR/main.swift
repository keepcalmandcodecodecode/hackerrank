//
//  main.swift
//  MaximizingXOR
//
//  Created by Developer on 01/02/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the maximizingXor function below.
func maximizingXor(l: Int, r: Int) -> Int {
    var maxXor = 0
    for i in l...r {
        for j in l...r {
            let xor = i ^ j
            if xor > maxXor {
                maxXor = xor
            }
        }
    }
    return maxXor
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let l = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let r = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = maximizingXor(l: l, r: r)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
