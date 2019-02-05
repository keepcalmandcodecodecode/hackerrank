//
//  main.swift
//  CounterGame
//
//  Created by developer on 2/5/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the counterGame function below.
func counterGame(n: Int) -> String {
    var turn = 0
    var n = n
    while n > 1 {
        if n == ((n >> 1) << 1) {
            n = n >> 1
        } else {
            var tmp = 1
            while tmp < n {
                tmp = tmp << 1
            }
            if tmp > n {
                tmp = tmp >> 1
            }
            n = n - tmp
        }
        turn += 1
    }
    if turn%2 == 0 {
        return "Richard"
    } else {
        return "Louise"
    }
}

print(counterGame(n: 6))

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        else { fatalError("Bad input") }
    
    let result = counterGame(n: n)
    
    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
