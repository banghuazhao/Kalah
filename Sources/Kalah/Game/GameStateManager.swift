//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

class GameStateManager {
    private let board: Board
    private let playerManager: PlayerManager
    
    init(board: Board, playerManager: PlayerManager) {
        self.board = board
        self.playerManager = playerManager
    }
    
    func isGameOver() -> Bool {
        // The game ends if the current player's houses are empty
        return board.isPlayerHouseEmpty(playerManager.currentPlayerIndexValue)
    }
    
    func endGame() {
        // Collect remaining seeds from both sides
        board.collectRemainingSeeds()
    }
}
