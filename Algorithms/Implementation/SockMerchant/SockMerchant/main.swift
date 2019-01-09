//
//  main.swift
//  SockMerchant
//
//  Created by developer on 1/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var uniqueSocks:[Int:Int] = [:]
    var pairsCount = 0
    for sock in ar {
        if uniqueSocks[sock] != nil {
            uniqueSocks.removeValue(forKey: sock)
            pairsCount = pairsCount + 1
        } else {
            uniqueSocks[sock] = 1
        }
    }
    return pairsCount
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = sockMerchant(n: n, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
