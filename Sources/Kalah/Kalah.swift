//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

class Kalah {
    private var gameEngine: GameEngine
    private var boardDisplay: BoardDisplay
    private var inputHandler: InputHandler
    private var quit: Bool
    
    init(config: GameConfig = GameConfig.fiveFour()) {
        self.gameEngine = GameEngine(config: config)
        self.boardDisplay = BoardDisplay(board: gameEngine.gameBoard, clockwise: config.clockwise)
        self.inputHandler = InputHandler(maxHouseNumber: config.housesPerPlayer)
        self.quit = false
    }
    
    func play() {
        while !quit {
            boardDisplay.displayBoard()
            let currentPlayer = gameEngine.currentPlayer
            print("Player \(currentPlayer.name)'s turn - Specify house number or 'q' to quit: ", terminator: "")
            
            handlePlayerTurn()
            
            // Check if game is over after the move
            if gameEngine.isGameOver() {
                boardDisplay.displayBoard()
                print("Game over")
                boardDisplay.displayBoard()
                gameEngine.endGame()
                break
            }
        }
        
        displayGameResults()
    }
    
    private func handlePlayerTurn() {
        guard let input = inputHandler.getInput() else { return }
        
        if inputHandler.isQuitCommand(input) {
            quit = true
            return
        }
        
        let currentPlayer = gameEngine.currentPlayer
        guard let houseNumber = inputHandler.parseHouseNumber(input) else {
            print("Invalid input. Please enter a house number between 1 and \(inputHandler.maxHouseNumberValue), or 'q' to quit.")
            return
        }
        
        if !inputHandler.isValidMove(houseNumber, board: gameEngine.gameBoard, currentPlayer: currentPlayer.playerId) {
            print("House is empty. Move again.")
            return
        }
        
        _ = gameEngine.makeMove(houseIndex: houseNumber - 1)
    }
    
    private func displayGameResults() {
        if quit {
            // Player quit with 'q' - only show board and Game Over
            print("Game over")
            boardDisplay.displayBoard()
        } else {
            // Game ended naturally - show scores and winner
            let p1Score = gameEngine.gameBoard.getStore(Board.player1).seedCount
            let p2Score = gameEngine.gameBoard.getStore(Board.player2).seedCount
            print("\tplayer 1: \(p1Score)")
            print("\tplayer 2: \(p2Score)")
            
            if p1Score > p2Score {
                print("Player 1 wins!")
            } else if p2Score > p1Score {
                print("Player 2 wins!")
            } else {
                print("A tie!")
            }
        }
    }
}
