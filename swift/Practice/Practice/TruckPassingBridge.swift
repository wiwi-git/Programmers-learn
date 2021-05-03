//
//  TruckPassingBridge.swift
//  Practice
//
//  Created by 위대연 on 2021/04/30.
//

import Foundation
class TruckPassingBridge {
  struct Truck {
    let weight:Int
    var position:Int = 0
  }
  
  func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    func totalTruckWeight(truckArray:[Truck]) -> Int {
      var result = 0
      for item in truckArray {
        result += item.weight
      }
      return result
    }
    
    var passingArray = [Truck]()
    var endArray = [Truck]()
    var truckArray = [Truck]()
    
    for item in truck_weights {
      let truck = Truck(weight: item, position: 0)
      truckArray.append(truck)
    }
    
    var waitArray:[Truck] = truckArray
    var time = 0
    
    while endArray.count < truckArray.count {
      if passingArray.count > 0 {
        for index in 0 ..< passingArray.count {
          passingArray[index].position += 1
        }
        if passingArray[0].position >= bridge_length {
          //print("end \(passingArray[0].weight) time:\(time)")
          endArray.append(passingArray[0])
          passingArray.remove(at: 0)
        }
      }
      if waitArray.count > 0 {
        if (totalTruckWeight(truckArray: passingArray) + waitArray[0].weight) <= weight {
          //print("passing - \(waitArray.first!) time - \(time)")
          passingArray.append(waitArray.first!)
          waitArray.removeFirst()
        }
      }
      time += 1
    }
    return time
  }
}
