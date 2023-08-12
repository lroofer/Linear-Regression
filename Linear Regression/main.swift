//
//  main.swift
//  Linear Regression
//
//  Created by Егор Колобаев on 12.08.2023.
//

import Foundation
import Accelerate

var A: [Double] = [
    [2, 3, 5],
    [1, 4, 6]
].flatMap{$0}

var B: [Double] = [
    [1],
    [2],
    [4]
].flatMap{$0}

let C = MLModel.qmmult(A, B, firstD: 2, secondD: 3, thirdD: 1)
print(C)
