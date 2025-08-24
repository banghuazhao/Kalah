//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

class BoardDisplay {
    private let board: Board
    private let displayClockwise: Bool
    
    init(board: Board, clockwise: Bool = false) {
        self.board = board
        self.displayClockwise = clockwise
    }
    
    func displayBoard() {
        printTopBorder()
        printP2Row()
        printMiddleBorder()
        printP1Row()
        printBottomBorder()
    }
    
    private func printTopBorder() {
        var sb = "+----"
        for _ in 0..<board.houseCount {
            sb += "+-------"
        }
        sb += "+----+"
        print(sb)
    }
    
    private func printP2Row() {
        var sb = ""
        
        if displayClockwise {
            // Clockwise display: left is P1 store count, right is P2 label
            sb += "| \(padNum(board.getStore(Board.player1).seedCount)) "
        } else {
            // Anti-clockwise display: left is P2 label
            sb += "| P2 "
        }

        // Houses for player 2
        if displayClockwise {
            for i in 0..<board.houseCount {
                let house = board.getHouse(Board.player2, i)
                sb += "| \(house.houseNumber)[\(padNum(house.seedCount))] "
            }
        } else {
            for i in (0..<board.houseCount).reversed() {
                let house = board.getHouse(Board.player2, i)
                sb += "| \(house.houseNumber)[\(padNum(house.seedCount))] "
            }
        }

        if displayClockwise {
            sb += "| P2 |"
        } else {
            sb += "| \(padNum(board.getStore(Board.player1).seedCount)) |"
        }

        print(sb)
    }
    
    private func printMiddleBorder() {
        var sb = "|    |-------"
        for _ in 1..<board.houseCount {
            sb += "+-------"
        }
        sb += "|    |"
        print(sb)
    }
    
    private func printP1Row() {
        var sb = ""
        
        if displayClockwise {
            // Clockwise display: left is P1 label
            sb += "| P1 "
        } else {
            // Anti-clockwise display: left is P2 store count
            sb += "| \(padNum(board.getStore(Board.player2).seedCount)) "
        }

        if displayClockwise {
            for i in (0..<board.houseCount).reversed() {
                let house = board.getHouse(Board.player1, i)
                sb += "| \(house.houseNumber)[\(padNum(house.seedCount))] "
            }
        } else {
            for i in 0..<board.houseCount {
                let house = board.getHouse(Board.player1, i)
                sb += "| \(house.houseNumber)[\(padNum(house.seedCount))] "
            }
        }
        
        if displayClockwise {
            sb += "| \(padNum(board.getStore(Board.player2).seedCount)) |"
        } else {
            sb += "| P1 |"
        }
        
        print(sb)
    }
    
    private func printBottomBorder() {
        var sb = "+----"
        for _ in 0..<board.houseCount {
            sb += "+-------"
        }
        sb += "+----+"
        print(sb)
    }
    
    private func padNum(_ n: Int) -> String {
        var s = String(n)
        while s.count < 2 {
            s = " " + s
        }
        return s
    }
}
