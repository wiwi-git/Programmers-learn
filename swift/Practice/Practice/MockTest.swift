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
    private var loopCount:Int {
      didSet {
        if loopCount == loopAnsers.count {
          loopCount = 0
        }
      }
    }
    var score = 0
    var answer: Int {
      mutating get {
        let index = self.loopCount
        self.loopCount += 1
        return self.loopAnsers[index]
      }
    }
    
    init(id:Int,loopAnsers:[Int],_ loopCount:Int = 0) {
      self.id = id
      self.loopAnsers = loopAnsers
      self.loopCount = loopCount
    }
    
  }
  func solution(_ answers:[Int]) -> [Int] {
    var people:[TestPaper] = [
      TestPaper(id: 1, loopAnsers: [1,2,3,4,5]),
      TestPaper(id: 2, loopAnsers: [2,1,2,3,2,4,2,5]),
      TestPaper(id: 3, loopAnsers: [3,3,1,1,2,2,4,4,5,5])
    ]
    
    for answer in answers {
      for index in 0 ..< people.count {
        if answer == people[index].answer {
          people[index].score += 1
        }
      }
    }
    
    people.sort { post, before in
      post.score > before.score
    }
    
    var result = [people.first!.id]
    
    if people[0].score == people[1].score {
      result.append(people[1].id)
      if people[1].score == people[2].score {
        result.append(people[2].id)
      }
    }
    return result
  }
}
