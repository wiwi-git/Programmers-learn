//
//  main.swift
//  Practice
//
//  Created by 위대연 on 2021/04/28.
//

import Foundation

let truckP = TruckPassingBridge()
struct Question {
    let bridgeLength:Int
    let weight:Int
    let truckWeights:[Int]
}
var questions:[Question] = [
    Question(bridgeLength: 2, weight: 10, truckWeights: [7,4,5,6]),
//    Question(bridgeLength: 100, weight: 100, truckWeights: [10]),
//    Question(bridgeLength: 100, weight: 100, truckWeights: [10,10,10,10,10,10,10,10,10,10])
]

for question in questions {
    print(truckP.solution(question.bridgeLength, question.weight, question.truckWeights))
}
