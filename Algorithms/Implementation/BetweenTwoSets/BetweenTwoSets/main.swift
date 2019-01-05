//
//  main.swift
//  BetweenTwoSets
//
//  Created by developer on 1/5/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

/*
 * Complete the getTotalX function below.
 */
func getTotalX(a: [Int], b: [Int]) -> Int {
    var start = a.reduce(a.last!, { result, item in
        if result > item {
            return result
        } else {
            return item
        }
    })
    var end = b.reduce(b.first!, { result, item in
        if result > item {
            return item
        } else {
            return result
        }
    })
    if start > end {
        let tmpStart = start
        start = end
        end = tmpStart
    }
    var count = 0
    for i in start...end {
        var j = 0
        var hasRemainder = i % a[j] == 0
        while j < a.count && hasRemainder {
            hasRemainder = hasRemainder && i%a[j] == 0
            j = j + 1
        }
        if hasRemainder {
            j = 0
            var isFactor = b[j] % i == 0
            while j < b.count && isFactor {
                isFactor = isFactor && b[j]%i == 0
                j = j + 1
            }
            if(isFactor) {
                count = count + 1
            }
        }
    }
    return count
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let nmTemp = readLine() else { fatalError("Bad input") }
let nm = nmTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nm[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let m = Int(nm[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let aTemp = readLine() else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

guard let bTemp = readLine() else { fatalError("Bad input") }
let b: [Int] = bTemp.split(separator: " ").map {
    if let bItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return bItem
    } else { fatalError("Bad input") }
}

guard b.count == m else { fatalError("Bad input") }

let total = getTotalX(a: a, b: b)

fileHandle.write(String(total).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
