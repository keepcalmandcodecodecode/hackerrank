//
//  main.swift
//  DivisibleSumPairs
//
//  Created by developer on 1/1/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    var countOfPairs = 0
    for i in 0..<n {
        for j in i+1..<n {
            if (ar[i]+ar[j])%k == 0 {
                countOfPairs = countOfPairs + 1
            }
        }
    }
    return countOfPairs
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nkTemp = readLine() else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = divisibleSumPairs(n: n, k: k, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
