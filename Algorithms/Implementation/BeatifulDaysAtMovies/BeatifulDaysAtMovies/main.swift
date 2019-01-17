//
//  main.swift
//  BeatifulDaysAtMovies
//
//  Created by developer on 1/17/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the beautifulDays function below.
extension Int {
    
    func pow(count: Int) -> Int {
        var i = 0
        var result = 1
        while i < count {
            result = result * self
            i = i + 1
        }
        return result
    }
    
    func reversed() -> Int {
        var tmp = self
        var numbers:[Int] = []
        while tmp > 0 {
            numbers.append(tmp%10)
            tmp = tmp / 10
        }
        
        var index = numbers.count - 1
        var result = 0
        while index >= 0 {
            result = result + numbers[index]*10.pow(count: numbers.count-1-index)
            index = index - 1
        }
        return result
    }
    
    func abs() -> Int {
        if self < 0 {
            return -self
        }
        return self
    }
}

func beautifulDays(i: Int, j: Int, k: Int) -> Int {
    var count = 0
    for l in i...j {
        if (l-l.reversed()).abs() % k == 0 {
            count = count + 1
        }
    }
    return count
}

print(10.reversed())
print(26.reversed())

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let ijkTemp = readLine() else { fatalError("Bad input") }
let ijk = ijkTemp.split(separator: " ").map{ String($0) }

guard let i = Int(ijk[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let j = Int(ijk[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let k = Int(ijk[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

let result = beautifulDays(i: i, j: j, k: k)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
