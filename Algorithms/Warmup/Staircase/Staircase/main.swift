//
//  main.swift
//  Staircase
//
//  Created by dev on 28/12/2018.
//  Copyright © 2018 easy. All rights reserved.
//

import Foundation

// Complete the staircase function below.
func staircase(n: Int) -> Void {
    var row = 0
    while row < n {
        var column = 0
        while column < n {
            if column >= (n - row - 1) {
                print("#", terminator: "")
            } else {
                print(" ", terminator: "")
            }
            column = column + 1
        }
        print("")
        row = row + 1
    }
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

staircase(n: n)

