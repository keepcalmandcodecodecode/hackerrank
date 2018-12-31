//
//  main.swift
//  GradingStudents
//
//  Created by developer on 12/31/18.
//  Copyright © 2018 developer. All rights reserved.
//

import Foundation

/*
 * Complete the gradingStudents function below.
 */
func gradingStudents(grades: [Int]) -> [Int] {
    let resultGrades = grades.map { item -> Int in
        var resultItem = item
        let remainder = item % 5
        if remainder > 2 && remainder > 0 {
            resultItem = item + 5 - remainder
        }
        if resultItem < 40 {
            return item
        }
        return resultItem
    }
    return resultGrades
}

print(gradingStudents(grades: [73,67,38,33]))

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let grades: [Int] = AnyIterator{ readLine() }.prefix(n).map {
    if let gradesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return gradesItem
    } else { fatalError("Bad input") }
}

guard grades.count == n else { fatalError("Bad input") }

let result = gradingStudents(grades: grades)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
