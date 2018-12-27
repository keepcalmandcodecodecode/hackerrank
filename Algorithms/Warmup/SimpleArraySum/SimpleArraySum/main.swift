//
//  main.swift
//  SimpleArraySum
//
//  Created by dev on 27/12/2018.
//  Copyright © 2018 easy. All rights reserved.
//

import Foundation

// number of elements
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

// find and print the sum of array
let sum = arr.reduce(0, {$0 + $1})
print(sum)
