//
//  main.swift
//  MatrixLayerRotation
//
//  Created by developer on 1/1/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

func rotateMatrixLayer(matrix: [[Int]], indexOfLayer: Int) -> [[Int]] {
    var rotatedMatrix = matrix
    
    let firstRowIndex = indexOfLayer
    let lastRowIndex = rotatedMatrix.count - indexOfLayer - 1
    let firstColumnIndex = indexOfLayer
    let lastColumnIndex = rotatedMatrix[indexOfLayer].count - indexOfLayer - 1
    
    //first column, last column
    for i in firstRowIndex..<lastRowIndex {
        rotatedMatrix[i+1][firstColumnIndex] = matrix[i][firstColumnIndex]
        rotatedMatrix[i][lastColumnIndex] = matrix[i+1][lastColumnIndex]
    }
    rotatedMatrix[firstRowIndex][firstColumnIndex] = matrix[firstRowIndex][firstColumnIndex+1]
    rotatedMatrix[lastRowIndex][lastColumnIndex] = matrix[lastRowIndex][lastColumnIndex-1]
    //first row, last row
    for i in firstColumnIndex..<lastColumnIndex {
        rotatedMatrix[firstRowIndex][i] = matrix[firstRowIndex][i+1]
        rotatedMatrix[lastRowIndex][i+1] = matrix[lastRowIndex][i]
    }
    rotatedMatrix[firstRowIndex][lastColumnIndex] = matrix[firstRowIndex+1][lastColumnIndex]
    rotatedMatrix[lastRowIndex][firstColumnIndex] = matrix[lastRowIndex-1][firstColumnIndex]
    
    return rotatedMatrix
}

func matrixRotation(matrix: [[Int]], r: Int) -> Void {
    var rotatedMatrix = matrix
    let countOfLayers = matrix.count / 2
    for indexOfLayer in 0..<countOfLayers {
        for _ in 0..<r {
            rotatedMatrix = rotateMatrixLayer(matrix: rotatedMatrix, indexOfLayer: indexOfLayer)
        }
    }
    for itemArray in rotatedMatrix {
        for item in itemArray {
            print(item, terminator: " ")
        }
        print("")
    }
}

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


