//
//  main.swift
//  BirthdayChocolate
//
//  Created by developer on 1/10/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the birthday function below.
func birthday(s: [Int], d: Int, m: Int) -> Int {
    var segmentsCount = 0
    for i in 0..<s.count {
        var isSegmentFinded = false
        var length = 0
        var squaresCount = 0
        var j = i
        while j < s.count {
            length = length + 1
            squaresCount = squaresCount + s[j]
            if length == m && squaresCount == d {
                j = s.count
                isSegmentFinded = true
            } else if length > m || squaresCount > d {
                j = s.count
                isSegmentFinded = false
            }
            j = j + 1
        }
        if isSegmentFinded {
            segmentsCount = segmentsCount + 1
        }
    }
    return segmentsCount
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let sTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let s: [Int] = sTemp.split(separator: " ").map {
    if let sItem = Int($0) {
        return sItem
    } else { fatalError("Bad input") }
}

guard s.count == n else { fatalError("Bad input") }

guard let dmTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let dm = dmTemp.split(separator: " ").map{ String($0) }

guard let d = Int(dm[0])
    else { fatalError("Bad input") }

guard let m = Int(dm[1])
    else { fatalError("Bad input") }

let result = birthday(s: s, d: d, m: m)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
