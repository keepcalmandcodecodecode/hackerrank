//
//  main.swift
//  JumpingOnTheClouds
//
//  Created by developer on 7/28/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the jumpingOnClouds function below.
func jumpingOnClouds(c: [Int]) -> Int {
    var steps = 0
    var i = 1
    var cursor = 0
    while i < c.count {
        if i == c.count - 1 {
            steps += 1
            cursor = i
            i += 1
            continue
        }
        if c[i] == 1 {
            i += 1
            continue;
        }
        if c[i] == 0 {
            if (cursor == (i-1) || cursor == i) && c[i+1] == 0 {
                cursor = i+1
                steps += 1
                i += 2
            } else {
                if cursor != i {
                    steps += 1
                }
                cursor = i
                i += 1
            }
        } else {
            i += 1
        }
    }
    return steps
}

print(jumpingOnClouds(c: [0, 0, 1, 0, 0, 1, 0]))
print(jumpingOnClouds(c: [0, 0, 0, 1, 0, 0]))
/*

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let cTemp = readLine() else { fatalError("Bad input") }
let c: [Int] = cTemp.split(separator: " ").map {
    if let cItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return cItem
    } else { fatalError("Bad input") }
}

guard c.count == n else { fatalError("Bad input") }

let result = jumpingOnClouds(c: c)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
*/
