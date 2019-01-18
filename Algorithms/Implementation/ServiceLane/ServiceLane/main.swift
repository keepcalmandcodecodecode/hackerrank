//
//  main.swift
//  ServiceLane
//
//  Created by developer on 1/18/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the serviceLane function below.
func serviceLane(n: Int, cases: [[Int]], widths: [Int]) -> [Int] {
    var result: [Int] = []
    for testCase in cases {
        let start = testCase[0]
        let end = testCase[1]
        var min = widths[start]
        for i in start...end {
            if widths[i] < min {
                min = widths[i]
            }
        }
        result.append(min)
    }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let ntTemp = readLine() else { fatalError("Bad input") }
let nt = ntTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nt[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let t = Int(nt[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let widthTemp = readLine() else { fatalError("Bad input") }
let width: [Int] = widthTemp.split(separator: " ").map {
    if let widthItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return widthItem
    } else { fatalError("Bad input") }
}

guard width.count == n else { fatalError("Bad input") }

let cases: [[Int]] = AnyIterator{ readLine() }.prefix(t).map {
    let casesRow: [Int] = $0.split(separator: " ").map {
        if let casesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return casesItem
        } else { fatalError("Bad input") }
    }
    
    guard casesRow.count == 2 else { fatalError("Bad input") }
    
    return casesRow
}

guard cases.count == t else { fatalError("Bad input") }

let result = serviceLane(n: n, cases: cases, widths: width)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
