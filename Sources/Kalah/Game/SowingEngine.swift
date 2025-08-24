//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

class SowingEngine {
    private let board: Board
    
    init(board: Board) {
        self.board = board
    }
    
    func sowSeeds(playerId: Int, startHouseIndex: Int, initialSeedsToSow: Int) -> Bool {
        var state = initializeSowingState(playerId: playerId, startHouseIndex: startHouseIndex, initialSeedsToSow: initialSeedsToSow)
        
        while state.remainingSeeds > 0 {
            if state.currentSide == playerId {
                if !sowOnPlayerSide(&state, playerId: playerId) {
                    break
                }
            } else {
                if !sowOnOpponentSide(&state) {
                    break
                }
            }
        }
        
        return state.lastSeedInStore
    }
    
    private func initializeSowingState(playerId: Int, startHouseIndex: Int, initialSeedsToSow: Int) -> SowingState {
        var state = SowingState()
        state.currentSide = playerId
        state.currentPos = startHouseIndex
        state.remainingSeeds = initialSeedsToSow
        state.lastSeedInStore = false
        
        // Move to next pit before sowing
        state.currentPos = board.moveToNextPosition(state.currentPos)
        if state.currentPos >= board.houseCount {
            state.currentSide = playerId
            state.currentPos = board.houseCount
        }
        
        return state
    }
    
    private func sowOnPlayerSide(_ state: inout SowingState, playerId: Int) -> Bool {
        return state.currentPos == board.houseCount
            ? handlePlayerStore(&state, playerId: playerId)
            : handlePlayerHouse(&state, playerId: playerId)
    }
    
    private func handlePlayerStore(_ state: inout SowingState, playerId: Int) -> Bool {
        state.lastSeedInStore = board.distributeSeedsInStore(playerId, state.remainingSeeds)
        if state.lastSeedInStore {
            return false // Break the loop
        }
        state.remainingSeeds -= 1
        state.currentSide = board.switchTurnIfNeeded(state.currentSide)
        state.currentPos = 0
        return true // Continue the loop
    }
    
    private func handlePlayerHouse(_ state: inout SowingState, playerId: Int) -> Bool {
        let wasEmpty = board.getHouse(state.currentSide, state.currentPos).isEmpty
        board.distributeSeedsInHouse(state.currentSide, state.currentPos)
        state.remainingSeeds -= 1
        
        if state.remainingSeeds == 0 {
            // Last seed landed in player's own house
            if board.isCapture(wasEmpty, state.currentSide, state.currentPos, playerId) {
                board.performCapture(playerId, state.currentSide, state.currentPos)
            }
            return false // Break the loop
        }
        
        state.currentPos = board.moveToNextPosition(state.currentPos)
        return state.currentPos >= board.houseCount
            ? handlePlayerStore(&state, playerId: playerId)
            : true // Continue the loop
    }
    
    private func sowOnOpponentSide(_ state: inout SowingState) -> Bool {
        board.distributeSeedsInHouse(state.currentSide, state.currentPos)
        state.remainingSeeds -= 1

        if state.remainingSeeds == 0 {
            // Last seed landed in opponent's house - switch player
            return false // Break the loop
        }

        state.currentPos = board.moveToNextPosition(state.currentPos)
        if state.currentPos >= board.houseCount {
            state.currentSide = board.switchTurnIfNeeded(state.currentSide)
            state.currentPos = 0
        }
        return true // Continue the loop
    }
    
    /**
     * Helper struct to hold sowing state
     */
    private struct SowingState {
        var currentSide: Int = 0
        var currentPos: Int = 0
        var remainingSeeds: Int = 0
        var lastSeedInStore: Bool = false
    }
}
