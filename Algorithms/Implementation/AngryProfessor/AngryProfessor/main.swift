//
//  main.swift
//  AngryProfessor
//
//  Created by developer on 1/13/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the angryProfessor function below.
func angryProfessor(k: Int, a: [Int]) -> String {
    let lateStudentsCount = a.reduce(0, {
        if $1 > 0 {
            return $0+1
        } else {
            return $0
        }
    })
    if (a.count - lateStudentsCount) >= k {
        return "NO"
    } else {
        return "YES"
    }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for tItr in 1...t {
    guard let nkTemp = readLine() else { fatalError("Bad input") }
    let nk = nkTemp.split(separator: " ").map{ String($0) }
    
    guard let n = Int(nk[0].trimmingCharacters(in: .whitespacesAndNewlines))
        else { fatalError("Bad input") }
    
    guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
        else { fatalError("Bad input") }
    
    guard let aTemp = readLine() else { fatalError("Bad input") }
    let a: [Int] = aTemp.split(separator: " ").map {
        if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return aItem
        } else { fatalError("Bad input") }
    }
    
    guard a.count == n else { fatalError("Bad input") }
    
    let result = angryProfessor(k: k, a: a)
    
    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
