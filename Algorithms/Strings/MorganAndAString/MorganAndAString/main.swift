//
//  main.swift
//  MorganAndAString
//
//  Created by Developer on 30/01/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the morganAndString function below.
func morganAndString(a: String, b: String) -> String {
    var reducedA = a
    var reducedB = b
    var result = ""
    var charCount = reducedA.count + reducedB.count
    while charCount > 0 {
        let comparisonResult: ComparisonResult;
        if reducedA.count > 0 && reducedB.count > 0 {
            comparisonResult = reducedA.compare(reducedB)
        } else if reducedA.count > 0 {
            comparisonResult = .orderedAscending
        } else {
            comparisonResult = .orderedDescending
        }
        switch comparisonResult {
            case .orderedAscending, .orderedSame:
                result.append(reducedA.first!)
                reducedA.removeFirst()
            case .orderedDescending:
                result.append(reducedB.first!)
                reducedB.removeFirst()
        }
       charCount-=1
    }
    return result
}

print(morganAndString(a: "JACK", b: "DANIEL"))

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for _ in 1...t {
    guard let a = readLine() else { fatalError("Bad input") }
    
    guard let b = readLine() else { fatalError("Bad input") }
    
    let result = morganAndString(a: a, b: b)
    
    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
