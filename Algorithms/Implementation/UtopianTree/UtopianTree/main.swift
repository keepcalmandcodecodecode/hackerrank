//
//  main.swift
//  UtopianTree
//
//  Created by developer on 1/13/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the utopianTree function below.
func utopianTree(n: Int) -> Int {
    var i = 0
    var height = 1
    while i <= n {
        if i != 0 {
            if i%2 == 0 {
                height = height + 1
            } else {
                height = height * 2
            }
        }
        i = i + 1
    }
    return height
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for _ in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
        else { fatalError("Bad input") }
    
    let result = utopianTree(n: n)
    
    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
