//
//  main.swift
//  Array-DS
//
//  Created by developer on 12/30/18.
//  Copyright © 2018 developer. All rights reserved.
//

import Foundation

// Complete the reverseArray function below.
func reverseArray(a: [Int]) -> [Int] {
    let halfCount = a.count / 2
    let count = a.count
    var reversedArray = a
    var i = 0
    while i < halfCount {
        let tmp = reversedArray[i]
        reversedArray[i] = reversedArray[count - i - 1]
        reversedArray[count - i - 1] = tmp
        i = i + 1
    }
    return reversedArray
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arrCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == arrCount else { fatalError("Bad input") }

let res = reverseArray(a: arr)

fileHandle.write(res.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
