//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

class InputHandler {
    private static let minHouseNumber = 1
    private static let quitCommand = "q"
    
    private let maxHouseNumber: Int
    
    init(maxHouseNumber: Int = 5) {
        self.maxHouseNumber = maxHouseNumber
    }
    
    func getInput() -> String? {
        return readLine()
    }
    
    func isQuitCommand(_ input: String?) -> Bool {
        return input?.trimmingCharacters(in: .whitespacesAndNewlines) == InputHandler.quitCommand
    }
    
    func parseHouseNumber(_ input: String?) -> Int? {
        guard let input = input else { return nil }
        
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let houseNum = Int(trimmedInput) else {
            return nil
        }
        
        if houseNum >= InputHandler.minHouseNumber && houseNum <= maxHouseNumber {
            return houseNum
        }
        
        return nil
    }
    
    func isValidMove(_ houseNumber: Int?, board: Board, currentPlayer: Int) -> Bool {
        guard let houseNumber = houseNumber else { return false }
        
        let house = board.getHouse(currentPlayer, houseNumber - 1)
        return !house.isEmpty
    }
    
    var maxHouseNumberValue: Int {
        return self.maxHouseNumber
    }
}
