//
//  main.swift
//  CatsAndAMouse
//
//  Created by developer on 1/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the catAndMouse function below.
func catAndMouse(x: Int, y: Int, z: Int) -> String {
    let answers = ["Cat A","Cat B","Mouse C"]
    let distanceX = abs(x-z)
    let distanceY = abs(y-z)
    if distanceX > distanceY {
        return answers[1]
    } else if distanceX < distanceY {
        return answers[0]
    } else {
        return answers[2]
    }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

for _ in 1...q {
    guard let xyzTemp = readLine() else { fatalError("Bad input") }
    let xyz = xyzTemp.split(separator: " ").map{ String($0) }
    
    guard let x = Int(xyz[0].trimmingCharacters(in: .whitespacesAndNewlines))
        else { fatalError("Bad input") }
    
    guard let y = Int(xyz[1].trimmingCharacters(in: .whitespacesAndNewlines))
        else { fatalError("Bad input") }
    
    guard let z = Int(xyz[2].trimmingCharacters(in: .whitespacesAndNewlines))
        else { fatalError("Bad input") }
    
    let result = catAndMouse(x: x, y: y, z: z)
    
    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
