//
//  main.swift
//  GradingStudents
//
//  Created by developer on 4/19/17.
//  Copyright © 2017 developer. All rights reserved.
//

import Foundation

let countOfElements = Int(readLine()!)!

for _ in 1...countOfElements {
    var points = Int(readLine()!)!
    if points%5 >= 3 {
        let roundedPoints = 5 - points%5 + points
        if(roundedPoints < 40) {
            print(points)
        } else {
            print(roundedPoints)
        }
    } else {
        print(points)
    }
}
