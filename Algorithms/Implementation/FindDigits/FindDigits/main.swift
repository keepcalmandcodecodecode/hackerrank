//
//  main.swift
//  FindDigits
//
//  Created by developer on 1/12/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the findDigits function below.
func findDigits(n: Int) -> Int {
    var curN = n
    var result = 0
    while curN > 0 {
        let divisor = curN/10
        let remainder = curN%10
        if remainder != 0 {
            if n%remainder == 0 {
                result = result + 1
            }
        }
        curN = divisor
    }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for _ in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        else { fatalError("Bad input") }
    
    let result = findDigits(n: n)
    
    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
