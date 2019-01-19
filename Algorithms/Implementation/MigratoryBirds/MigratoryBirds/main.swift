//
//  main.swift
//  MigratoryBirds
//
//  Created by developer on 1/19/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the migratoryBirds function below.
func migratoryBirds(arr: [Int]) -> Int {
    var birdsCountMap: [Int:Int] = [:]
    for bird in arr {
        if birdsCountMap[bird] == nil {
            birdsCountMap[bird] = 1
        } else {
            birdsCountMap[bird] = birdsCountMap[bird]! + 1
        }
    }
    var maximum = 0
    var maximumKey = 0
    for (key,value) in birdsCountMap {
        if value > maximum {
            maximum = value
            maximumKey = key
        } else if value == maximum && maximumKey > key {
            maximumKey = key
            maximum = value
        }
    }
    return maximumKey
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arrCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == arrCount else { fatalError("Bad input") }

let result = migratoryBirds(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

