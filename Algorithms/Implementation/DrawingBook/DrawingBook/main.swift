//
//  main.swift
//  DrawingBook
//
//  Created by developer on 7/28/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

/*
 * Complete the pageCount function below.
 */
func pageCount(n: Int, p: Int) -> Int {
    if p == n {
        return 0
    }
    if p == 1 {
        return 0
    }
    
    let fromEnd = p > n/2
    if fromEnd {
        if n%2 == 0 {
            return (n-p + 1)/2
        } else {
            return (n-p)/2
        }
    } else {
        return p/2
    }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let p = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = pageCount(n: n, p: p)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
