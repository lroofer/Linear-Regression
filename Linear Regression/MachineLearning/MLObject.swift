//
//  MLObject.swift
//  Linear Regression
//
//  Created by Егор Колобаев on 12.08.2023.
//

import Foundation

class MLObject {
    var features: [Feature]
    func getData() -> [Double] {
        var arr = [Double]()
        for i in features {
            for j in i.getFormatted() {
                arr.append(j)
            }
        }
        return arr
    }
    init(features: [Feature]) {
        self.features = features
    }
}
