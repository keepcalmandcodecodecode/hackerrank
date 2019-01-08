//
//  main.swift
//  ViralAdvertising
//
//  Created by developer on 1/8/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the viralAdvertising function below.
func viralAdvertising(n: Int) -> Int {
    var likesCount = 0
    var sharesCount = 5
    let sharesMultiplier = 3
    for _ in 0..<n {
        let likes = sharesCount/2
        sharesCount = likes * sharesMultiplier
        likesCount = likesCount + likes
    }
    return likesCount
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = viralAdvertising(n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
