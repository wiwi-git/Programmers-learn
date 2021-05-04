//  문제 : 모의고사(https://programmers.co.kr/learn/courses/30/lessons/42840)
//  MockTest.swift
//  Practice
//
//  Created by 위대연 on 2021/05/04.
//

import Foundation
class MockTest {
  struct TestPaper {
    let id:Int
    private let loopAnsers:[Int]
    private var loopIndex:Int = 0
    var score = 0
    var answer: Int {
      mutating get {
        let index = loopIndex
        self.loopIndex += 1
        if loopIndex >= loopAnsers.count { self.loopIndex = 0 }
        return self.loopAnsers[index]
      }
    }
    
    init(id:Int,loopAnsers:[Int]) {
      self.id = id
      self.loopAnsers = loopAnsers
    }
  }
  
  func solution(_ answers:[Int]) -> [Int] {
    var people:[TestPaper] = [
      TestPaper(id: 1, loopAnsers: [1,2,3,4,5]),
      TestPaper(id: 2, loopAnsers: [2,1,2,3,2,4,2,5]),
      TestPaper(id: 3, loopAnsers: [3,3,1,1,2,2,4,4,5,5])
    ]
    // calc score
    for answer in answers {
      for index in 0 ..< people.count {
        if answer == people[index].answer {
          people[index].score += 1
        }
      }
    }
    
    // get top
    let top = people.sorted(by: {$0.score > $1.score}).first!
    
    // get result
    var result = [Int]()
    for person in people.filter({ $0.score == top.score}) {
      result.append(person.id)
    }
    return result
  }
}
