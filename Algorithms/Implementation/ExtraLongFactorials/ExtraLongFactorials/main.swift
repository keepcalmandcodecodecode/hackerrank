//
//  main.swift
//  ExtraLongFactorials
//
//  Created by dev on 11/01/2019.
//  Copyright © 2019 easy. All rights reserved.
//

import Foundation

func extraLongFactorials(n: Int) -> Void {
    var result:[Int] = [1]
    for i in 1..<n+1 {
        var j = 0
        let endIndex = result.count
        while j < endIndex {
            result[j] = result[j]*i
            j = j + 1
        }
        j = 0
        while j < result.count {
            if result[j] > 9 {
                if (j+1) == result.count {
                    result.append(0)
                }
                result[j+1] = result[j+1] + result[j]/10
                result[j] = result[j]%10
            }
            j = j + 1
        }
    }
    for i in result.reversed() {
        print(i, separator: "", terminator: "")
    }
    print("")
}


guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

extraLongFactorials(n: n)
