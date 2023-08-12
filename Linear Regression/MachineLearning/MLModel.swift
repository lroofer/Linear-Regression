//
//  MLModel.swift
//  Linear Regression
//
//  Created by Егор Колобаев on 12.08.2023.
//

import Foundation
import Accelerate

class MLModel {
    static func qmmult(_ A: [Double], _ B:[Double], firstD M: Int, secondD K: Int, thirdD N: Int) -> [Double] {
        var C = Array<Double>(repeating: 0, count: M * N)
        vDSP_mmulD(A, vDSP_Stride(1), B, vDSP_Stride(1), &C, vDSP_Stride(1), vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
        return C
    }
    
    var w: [Double]
    var alpha: Double
    var s: Int
    var m: Int
    func fit(trainData x: [Double], countData N: Int, countArray y: [Double]) {
        for _ in 1...s {
            var f = Array<Double>(repeating: 0, count: N)
            vDSP_mmulD(x, vDSP_Stride(1), w, vDSP_Stride(1), &f, vDSP_Stride(1), vDSP_Length(N), vDSP_Length(m + 1), vDSP_Length(N))
            let err = vDSP.subtract(f, y)
            var xT = Array<Array<Double>>(repeating: Array<Double>(), count: m + 1)
//            vDSP_mtransD(x, vDSP_Stride(1), &grad, vDSP_Stride(1), vDSP_Length(N), vDSP_Length(m + 1))
//            var
//            vDSP_mmulD(<#T##__A: UnsafePointer<Double>##UnsafePointer<Double>#>, <#T##__IA: vDSP_Stride##vDSP_Stride#>, <#T##__B: UnsafePointer<Double>##UnsafePointer<Double>#>, <#T##__IB: vDSP_Stride##vDSP_Stride#>, <#T##__C: UnsafeMutablePointer<Double>##UnsafeMutablePointer<Double>#>, <#T##__IC: vDSP_Stride##vDSP_Stride#>, <#T##__M: vDSP_Length##vDSP_Length#>, <#T##__N: vDSP_Length##vDSP_Length#>, <#T##__P: vDSP_Length##vDSP_Length#>)
        }
    }
    func predict(testData x: [[Double]]) -> [Double] {
        return []
    }
    init(alpha: Double, s: Int, m: Int) {
        self.alpha = alpha
        self.s = s
        self.m = m
        self.w = [1]
        for _ in 0..<m {
            self.w.append(Double.random(in: -20...20))
        }
    }
}
