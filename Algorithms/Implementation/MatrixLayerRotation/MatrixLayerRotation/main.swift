//
//  main.swift
//  MatrixLayerRotation
//
//  Created by developer on 1/1/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

func matrixRotation(matrix: [[Int]], r: Int) -> Void {
    var rotatedMatrix = matrix
    let countOfLayers = matrix.count / 2
    for indexOfLayer in 0..<countOfLayers {
        let firstRowIndex = indexOfLayer
        let lastRowIndex = rotatedMatrix.count - indexOfLayer - 1
        if firstRowIndex > lastRowIndex {
            continue
        }
        let firstColumnIndex = indexOfLayer
        let lastColumnIndex = rotatedMatrix[indexOfLayer].count - indexOfLayer - 1
        if firstColumnIndex > lastColumnIndex {
            continue
        }
        
        let truncatedR = r%((lastRowIndex - firstRowIndex - 1)*2+(lastColumnIndex-firstColumnIndex+1)*2)
        
        for _ in 0..<truncatedR {
            var sourceMatrix = rotatedMatrix
            
            //first column, last column
            for i in firstRowIndex..<lastRowIndex {
                rotatedMatrix[i+1][firstColumnIndex] = sourceMatrix[i][firstColumnIndex]
                rotatedMatrix[i][lastColumnIndex] = sourceMatrix[i+1][lastColumnIndex]
            }
            rotatedMatrix[firstRowIndex][firstColumnIndex] = sourceMatrix[firstRowIndex][firstColumnIndex+1]
            rotatedMatrix[lastRowIndex][lastColumnIndex] = sourceMatrix[lastRowIndex][lastColumnIndex-1]
            //first row, last row
            for i in firstColumnIndex..<lastColumnIndex {
                rotatedMatrix[firstRowIndex][i] = sourceMatrix[firstRowIndex][i+1]
                rotatedMatrix[lastRowIndex][i+1] = sourceMatrix[lastRowIndex][i]
            }
            rotatedMatrix[firstRowIndex][lastColumnIndex] = sourceMatrix[firstRowIndex+1][lastColumnIndex]
            rotatedMatrix[lastRowIndex][firstColumnIndex] = sourceMatrix[lastRowIndex-1][firstColumnIndex]
        }
    }
    for itemArray in rotatedMatrix {
        for item in itemArray {
            print(item, terminator: " ")
        }
        print("")
    }
}

matrixRotation(matrix: [[1, 2, 3, 4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], r: 10000000)

guard let mnrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let mnr = mnrTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mnr[0])
    else { fatalError("Bad input") }

guard let n = Int(mnr[1])
    else { fatalError("Bad input") }

guard let r = Int(mnr[2])
    else { fatalError("Bad input") }

let matrix: [[Int]] = AnyIterator{ readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) }.prefix(m).map {
    let matrixRow: [Int] = $0.split(separator: " ").map {
        if let matrixItem = Int($0) {
            return matrixItem
        } else { fatalError("Bad input") }
    }
    
    guard matrixRow.count == n else { fatalError("Bad input") }
    
    return matrixRow
}

guard matrix.count == m else { fatalError("Bad input") }

matrixRotation(matrix: matrix, r: r)


