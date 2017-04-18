//
//  main.swift
//  SimpleArraySum
//
//  Created by developer on 4/18/17.
//  Copyright © 2017 developer. All rights reserved.
//

import Foundation

let countOfElements = Int(readLine()!)!
let numbersArray = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let sum = numbersArray.reduce(0,+)
print("\(sum)")
