//  문제: 크레인 인형뽑기 게임 (https://programmers.co.kr/learn/courses/30/lessons/64061)
//  UFOGame.swift
//  Practice
//
//  Created by 위대연 on 2021/04/28.
//

import Foundation
/**
 let testBoard = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
 let testMoves = [1,5,3,5,1,2,1,4]
 */
class UFOGame {
    func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
        var basket = Array<Int>()
        var removeCount = 0
        var board = board
        for targetX in moves {
            let targetIndex = targetX - 1
            for y in 0 ..< board.count {
                if board[y][targetIndex] != 0 {
                    let temp = board[y][targetIndex]
                    board[y][targetIndex] = 0
                    if basket.count > 0 {
                        let basketLastIndex = basket.count - 1
                        let lastItem = basket[basketLastIndex]
                        if lastItem == temp {
                            basket.remove(at: basketLastIndex)
                            removeCount += 2
                        } else {
                            basket.append(temp)
                        }
                    } else {
                        basket.append(temp)
                    }
                    break;
                }
            }
        }
        return removeCount
    }
}
