//
//  main.swift
//  StrangeCounter
//
//  Created by developer on 1/5/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

func strangeCounter(t: Int) -> Int {
    var i = 1
    let q = 3
    var isIntervalNotFinded = true
    var number = t
    while isIntervalNotFinded {
        number = number - i*q
        if (number <= 0) {
            isIntervalNotFinded = false
            if(number < 0) {
                number = number*(-1)
            }
        } else {
            i = i*2
        }
    }
    return number+1
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = strangeCounter(t: t)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
