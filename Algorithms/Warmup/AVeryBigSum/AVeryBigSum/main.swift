//
//  main.swift
//  AVeryBigSum
//
//  Created by dev on 19/04/2017.
//  Copyright © 2017 easy. All rights reserved.
//

import Foundation


let n = Int(readLine()!)!

let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let result = arr.reduce(0,+)
print(result)
