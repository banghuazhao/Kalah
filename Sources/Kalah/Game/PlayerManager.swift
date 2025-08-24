//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

class PlayerManager {
    private var players: [Player]
    private var currentPlayerIndex: Int
    private let sowingEngine: SowingEngine
    
    init(sowingEngine: SowingEngine) {
        self.players = [
            Player(playerId: Board.player1, name: "P1"),
            Player(playerId: Board.player2, name: "P2")
        ]
        self.currentPlayerIndex = Board.player1
        self.sowingEngine = sowingEngine
    }
    
    var currentPlayer: Player {
        return players[currentPlayerIndex]
    }
    
    func switchPlayer() {
        currentPlayerIndex = 1 - currentPlayerIndex
    }
    
    var currentPlayerIndexValue: Int {
        return self.currentPlayerIndex
    }
    
    func executeMove(board: Board, houseIndex: Int) -> Bool {
        let currentPlayer = self.currentPlayer
        let selectedHouse = board.getHouse(currentPlayer.playerId, houseIndex)
        
        if selectedHouse.isEmpty {
            return false
        }
        
        let seedsToSow = selectedHouse.seedCount
        // Remove seeds from the house
        board.removeSeedsFromHouse(currentPlayer.playerId, houseIndex)
        
        let extraTurn = sowingEngine.sowSeeds(playerId: currentPlayer.playerId, startHouseIndex: houseIndex, initialSeedsToSow: seedsToSow)
        
        if !extraTurn {
            switchPlayer()
        }
        
        return true
    }
}
