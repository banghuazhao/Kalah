//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

struct GameConfig {
    let housesPerPlayer: Int
    let seedsPerHouse: Int
    let clockwise: Bool
    
    init(housesPerPlayer: Int = 5, seedsPerHouse: Int = 4, clockwise: Bool = false) {
        self.housesPerPlayer = housesPerPlayer
        self.seedsPerHouse = seedsPerHouse
        self.clockwise = clockwise
    }
    
    static func sevenFive() -> GameConfig {
        return GameConfig(housesPerPlayer: 7, seedsPerHouse: 5, clockwise: false)
    }
    
    static func fiveFour() -> GameConfig {
        return GameConfig(housesPerPlayer: 5, seedsPerHouse: 4, clockwise: false)
    }
}
