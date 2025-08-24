//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation
import ArgumentParser

struct KalahCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "kalah",
        abstract: "A command line implementation of the Kalah board game",
        discussion: """
        Kalah is a two-player strategy game where players take turns sowing seeds 
        from their houses into adjacent pits and stores. The goal is to capture 
        more seeds than your opponent.
        """
    )
    
    @Flag(name: .shortAndLong, help: "Use clockwise sowing direction")
    var clockwise = false
    
    @Flag(name: .shortAndLong, help: "Use 7 houses per player with 5 seeds each (default: 5 houses, 4 seeds)")
    var sevenFive = false
    
    func run() throws {
        print("Welcome to Kalah!")
        
        let config = GameConfig(
            housesPerPlayer: sevenFive ? 7 : 5,
            seedsPerHouse: sevenFive ? 5 : 4,
            clockwise: clockwise
        )
        
        let game = Kalah(config: config)
        game.play()
    }
}

// Main execution
KalahCommand.main()

