//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

class Board {
    static let player1 = 0
    static let player2 = 1
    static let totalPlayers = 2
    
    private let housesPerPlayer: Int
    private let seedsPerHouse: Int
    private var houses: [[House]]
    private var stores: [Store]
    
    init(housesPerPlayer: Int, seedsPerHouse: Int) {
        self.housesPerPlayer = housesPerPlayer
        self.seedsPerHouse = seedsPerHouse
        
        // Initialize houses
        self.houses = Array(repeating: Array(repeating: House(houseNumber: 0, initialSeeds: 0), count: housesPerPlayer), count: Board.totalPlayers)
        for player in 0..<Board.totalPlayers {
            for i in 0..<housesPerPlayer {
                houses[player][i] = House(houseNumber: i + 1, initialSeeds: seedsPerHouse)
            }
        }
        
        // Initialize stores
        self.stores = Array(repeating: Store(), count: Board.totalPlayers)
    }
    
    func getHouse(_ player: Int, _ houseIndex: Int) -> House {
        return houses[player][houseIndex]
    }
    
    func getStore(_ player: Int) -> Store {
        return stores[player]
    }
    
    var houseCount: Int {
        return housesPerPlayer
    }
    
    var seedsPerHouseValue: Int {
        return self.seedsPerHouse
    }
    
    func isPlayerHouseEmpty(_ player: Int) -> Bool {
        for i in 0..<housesPerPlayer {
            if houses[player][i].seedCount > 0 {
                return false
            }
        }
        return true
    }
    
    func collectRemainingSeeds() {
        for i in 0..<housesPerPlayer {
            // Sweep P1's houses
            let p1Seeds = houses[Board.player1][i].seedCount
            if p1Seeds > 0 {
                houses[Board.player1][i] = House(houseNumber: i + 1, initialSeeds: 0)
                stores[Board.player1].addSeeds(p1Seeds)
            }
            
            // Sweep P2's houses
            let p2Seeds = houses[Board.player2][i].seedCount
            if p2Seeds > 0 {
                houses[Board.player2][i] = House(houseNumber: i + 1, initialSeeds: 0)
                stores[Board.player2].addSeeds(p2Seeds)
            }
        }
    }
    
    func getOppositeHouse(_ player: Int, _ houseIndex: Int) -> House {
        let oppositeIndex = housesPerPlayer - 1 - houseIndex
        return houses[1 - player][oppositeIndex]
    }
    
    // Sowing helper methods
    func distributeSeedsInStore(_ playerId: Int, _ remainingSeeds: Int) -> Bool {
        stores[playerId].addSeed()
        return remainingSeeds == 1
    }
    
    func distributeSeedsInHouse(_ currentSide: Int, _ currentPos: Int) {
        houses[currentSide][currentPos] = House(houseNumber: currentPos + 1, initialSeeds: houses[currentSide][currentPos].seedCount + 1)
    }
    
    func moveToNextPosition(_ currentPos: Int) -> Int {
        return currentPos < housesPerPlayer - 1 ? currentPos + 1 : housesPerPlayer
    }
    
    func switchTurnIfNeeded(_ currentSide: Int) -> Int {
        return 1 - currentSide
    }
    
    func isCapture(_ wasEmpty: Bool, _ currentSide: Int, _ currentPos: Int, _ playerId: Int) -> Bool {
        return wasEmpty && !getOppositeHouse(playerId, currentPos).isEmpty
    }
    
    func performCapture(_ playerId: Int, _ currentSide: Int, _ currentPos: Int) {
        let oppositeHouse = getOppositeHouse(playerId, currentPos)
        let capturedSeeds = oppositeHouse.seedCount
        let lastSeed = houses[currentSide][currentPos].seedCount
        
        // Remove seeds from both houses
        houses[1 - playerId][housesPerPlayer - 1 - currentPos] = House(houseNumber: housesPerPlayer - currentPos, initialSeeds: 0)
        houses[currentSide][currentPos] = House(houseNumber: currentPos + 1, initialSeeds: 0)
        
        // Add to store
        stores[playerId].addSeeds(capturedSeeds + lastSeed)
    }
    
    func removeSeedsFromHouse(_ player: Int, _ houseIndex: Int) {
        houses[player][houseIndex] = House(houseNumber: houseIndex + 1, initialSeeds: 0)
    }
}
