//
//  main.swift
//  LisasWorkbook
//
//  Created by developer on 1/20/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the workbook function below.
func workbook(n: Int, k: Int, arr: [Int]) -> Int {
    var page = 1
    var countOfSpecialProblems = 0
    for i in 0..<n {
        let countOfProblems = arr[i]
        var currentProblem = 1
        while currentProblem <= countOfProblems {
            let startIndex = currentProblem
            var endIndex = currentProblem + k
            if endIndex > countOfProblems {
                endIndex = countOfProblems + 1
            }
            if page >= startIndex && page <= endIndex-1 {
                countOfSpecialProblems = countOfSpecialProblems + 1
            }
            currentProblem = currentProblem + k
            page = page + 1
        }
    }
    return countOfSpecialProblems
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

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let result = workbook(n: n, k: k, arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
