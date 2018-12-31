//
//  main.swift
//  TimeConversion
//
//  Created by developer on 12/30/18.
//  Copyright © 2018 developer. All rights reserved.
//

import Foundation

extension String {
    func string(from: Int, to: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: from, limitedBy: self.endIndex)!
        let end = self.index(self.startIndex, offsetBy: to, limitedBy: self.endIndex)!
        return String(self[start..<end])
    }
}

func timeConversion(s: String) -> String { 
    var hours = Int(s.string(from: 0, to: 2))!
    let minutes = Int(s.string(from: 3, to: 5))!
    let seconds = Int(s.string(from: 6, to: 8))!
    let halfDay = s.string(from: 8, to: 10)
    if (halfDay == "PM") {
        if(hours != 12) {
            hours = hours + 12
        }
    } else {
        if(hours == 12) {
            hours = 0
        }
    }
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let s = readLine() else { fatalError("Bad input") }

let result = timeConversion(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
