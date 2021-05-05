//  문제 : 기능개발(https://programmers.co.kr/learn/courses/30/lessons/42586)
//  FunctionDevelopment.swift
//  Practice
//
//  Created by 위대연 on 2021/05/04.
//

import Foundation
class FunctionDevelopment {
  
  func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var complete = Array<Int>(repeating: 0, count: progresses.count)
    
    for (i, persent) in progresses.enumerated() {
      var day = 0
      var persent = persent
      while persent < 100 {
        persent += speeds[i]
        day += 1
      }
      complete[i] = day
    }
    
    var i = 0
    var result = [Int]()
    while i < complete.count {
      var commit = 1
      if (i + 1) >= complete.count {
        result.append(commit)
        break
      }
      
      for k in (i + 1) ..< complete.count {
        if complete[i] >= complete[k] {
          commit += 1
        } else { break }
      }
      
      i += commit
      result.append(commit)
    }
    return result
  }
}
