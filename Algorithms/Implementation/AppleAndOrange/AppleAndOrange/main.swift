//
//  main.swift
//  AppleAndOrange
//
//  Created by developer on 1/4/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) {
    let applesCountOnSamsHouse = apples.reduce(0, { count, distance in
        let x = a + distance
        if x >= s && x <= t {
            return count + 1
        }
        return count
    })
    
    let orangesCountOnSamsHouse = oranges.reduce(0, { count, distance in
        let x = b + distance
        if x >= s && x <= t {
            return count + 1
        }
        return count
    })
    print(applesCountOnSamsHouse)
    print(orangesCountOnSamsHouse)
}

guard let stTemp = readLine() else { fatalError("Bad input") }
let st = stTemp.split(separator: " ").map{ String($0) }

guard let s = Int(st[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let t = Int(st[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let abTemp = readLine() else { fatalError("Bad input") }
let ab = abTemp.split(separator: " ").map{ String($0) }

guard let a = Int(ab[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let b = Int(ab[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let mnTemp = readLine() else { fatalError("Bad input") }
let mn = mnTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mn[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let n = Int(mn[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let applesString = readLine() else { fatalError("Bad input")}
let apples = applesString.split(separator: " ").map{Int($0)!}

guard let orangesString = readLine() else { fatalError("Bad input")}
let oranges = orangesString.split(separator: " ").map{Int($0)!}

countApplesAndOranges(s: s, t: t, a: a, b: b, apples: apples, oranges: oranges)
