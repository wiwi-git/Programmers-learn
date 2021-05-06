// 문제 : 프린터(https://programmers.co.kr/learn/courses/30/lessons/42587)
//  Printer.swift
//  Practice
//
//  Created by 위대연 on 2021/05/06.
//

import Foundation

class Printer {
  struct Work {
    let id:Character
    let priority:Int
  }
  func solution(_ priorities:[Int], _ location:Int) -> Int {
    var works = [Work]()
    var endArray = [Work]()
    var lastId:Character = "a"
    for priority in priorities {
      let work = Work(id: lastId, priority: priority)
      lastId = Character(Unicode.Scalar((lastId.unicodeScalars.first!.value) + 1)!)
      works.append(work)
    }
    /*
     for work in works {
     print(work.id, separator: "", terminator: " ")
     }
     */
    guard location < works.count else { return -1 }
    let findTarget = works[location]
    
    while works.count > 0 {
      let target = works[0]
      var notFind = true
      for i in 1 ..< works.count {
        if works[i].priority > target.priority {
          works.remove(at: 0)
          works.append(target)
          notFind = false
          break
        }
      }
      if notFind {
        works.remove(at: 0)
        endArray.append(target)
      }
    }
    /*
     for work in endArray {
     print(work.id, separator: "", terminator: " ")
     }
     */
    for i in 0 ..< endArray.count {
      if endArray[i].id == findTarget.id {
        return i + 1
      }
    }
    
    return -1
  }
}
