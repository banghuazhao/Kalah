//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

class GameEngine {
    private let board: Board
    private let playerManager: PlayerManager
    private let sowingEngine: SowingEngine
    private let gameStateManager: GameStateManager
    
    init(config: GameConfig) {
        self.board = Board(housesPerPlayer: config.housesPerPlayer, seedsPerHouse: config.seedsPerHouse)
        self.sowingEngine = SowingEngine(board: board)
        self.playerManager = PlayerManager(sowingEngine: sowingEngine)
        self.gameStateManager = GameStateManager(board: board, playerManager: playerManager)
    }
    
    var gameBoard: Board {
        return self.board
    }
    
    var currentPlayer: Player {
        return playerManager.currentPlayer
    }
    
    func makeMove(houseIndex: Int) -> Bool {
        return playerManager.executeMove(board: board, houseIndex: houseIndex)
    }
    
    func isGameOver() -> Bool {
        return gameStateManager.isGameOver()
    }
    
    func endGame() {
        gameStateManager.endGame()
    }
}
