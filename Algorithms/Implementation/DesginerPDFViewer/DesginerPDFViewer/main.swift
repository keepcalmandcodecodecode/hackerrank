//
//  main.swift
//  DesginerPDFViewer
//
//  Created by developer on 1/13/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

// Complete the designerPdfViewer function below.
func designerPdfViewer(h: [Int], word: String) -> Int {
    let width = word.count
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let heights:[Int] = word.map { character -> Int in
        let index = alphabet.firstIndex(of: character)
        let i = alphabet.distance(from: alphabet.startIndex, to: index!)
        return h[i]
    }
    let height = heights.reduce(0, {
        if $0 > $1 {
            return $0
        } else {
            return $1
        }
    })
    return width*height
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let hTemp = readLine() else { fatalError("Bad input") }
let h: [Int] = hTemp.split(separator: " ").map {
    if let hItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return hItem
    } else { fatalError("Bad input") }
}

guard h.count == 26 else { fatalError("Bad input") }

guard let word = readLine() else { fatalError("Bad input") }

let result = designerPdfViewer(h: h, word: word)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
