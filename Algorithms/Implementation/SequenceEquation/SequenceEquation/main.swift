//
//  main.swift
//  SequenceEquation
//
//  Created by developer on 1/22/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the permutationEquation function below.

func index(of: Int, inArray: [Int]) -> Int {
    var isFinded = false
    var index = 0
    while !isFinded {
        if inArray[index] == of {
            isFinded = true
        } else {
            index = index + 1
        }
    }
    return index
}

func permutationEquation(p: [Int]) -> [Int] {
    let n = p.count
    var result: [Int] = []
    for i in 1...n {
        let p_x = index(of: i, inArray: p) + 1
        let p_p_x = index(of: p_x, inArray: p) + 1
        result.append(p_p_x)
    }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let pTemp = readLine() else { fatalError("Bad input") }
let p: [Int] = pTemp.split(separator: " ").map {
    if let pItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return pItem
    } else { fatalError("Bad input") }
}

guard p.count == n else { fatalError("Bad input") }

let result = permutationEquation(p: p)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
