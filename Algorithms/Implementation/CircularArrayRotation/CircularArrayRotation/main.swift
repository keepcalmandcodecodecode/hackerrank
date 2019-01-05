//
//  main.swift
//  CircularArrayRotation
//
//  Created by developer on 1/5/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

func circularArrayRotation(a: [Int], k: Int, queries: [Int]) -> [Int] {
    var result:[Int] = []
    for query in queries {
        let count = a.count
        var offset = query - k
        if offset < 0 {
            offset = offset + count
        }
        offset = offset % count
        result.append(a[offset])
    }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nkqTemp = readLine() else { fatalError("Bad input") }
let nkq = nkqTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nkq[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let k = Int(nkq[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let q = Int(nkq[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let aTemp = readLine() else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

let queries: [Int] = AnyIterator{ readLine() }.prefix(q).map {
    if let queriesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return queriesItem
    } else { fatalError("Bad input") }
}

guard queries.count == q else { fatalError("Bad input") }

let result = circularArrayRotation(a: a, k: k, queries: queries)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
