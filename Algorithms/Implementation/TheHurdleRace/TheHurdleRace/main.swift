//
//  main.swift
//  TheHurdleRace
//
//  Created by developer on 1/3/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

func hurdleRace(k: Int, height: [Int]) -> Int {
    let maxHeight = height.reduce(height[0]) {
        if $1 > $0 {
            return $1
        } else {
            return $0
        }
    }
    if k > maxHeight {
        return 0
    } else {
        return maxHeight - k
    }
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

guard let heightTemp = readLine() else { fatalError("Bad input") }
let height: [Int] = heightTemp.split(separator: " ").map {
    if let heightItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return heightItem
    } else { fatalError("Bad input") }
}

guard height.count == n else { fatalError("Bad input") }

let result = hurdleRace(k: k, height: height)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
