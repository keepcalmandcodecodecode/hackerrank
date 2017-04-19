//
//  main.swift
//  SockMerchant
//
//  Created by developer on 4/19/17.
//  Copyright © 2017 developer. All rights reserved.
//

import Foundation

let countOfElements = Int(readLine()!)!
let socksArray = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var socksCountMap: [Int:Int] = [:]

for sock in socksArray {
    if let socks = socksCountMap[sock] {
        socksCountMap[sock] = socks + 1
    } else {
        socksCountMap[sock] = 1
    }
}

var countOfPairs = 0
for (socks, socksCount) in socksCountMap {
    countOfPairs = countOfPairs + socksCount/2
}

print("\(countOfPairs)")
