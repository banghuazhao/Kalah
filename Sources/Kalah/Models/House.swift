//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

struct House {
    let houseNumber: Int
    private(set) var seedCount: Int
    
    init(houseNumber: Int, initialSeeds: Int) {
        self.houseNumber = houseNumber
        self.seedCount = initialSeeds
    }
    
    mutating func addSeed() {
        seedCount += 1
    }
    
    mutating func addSeeds(_ count: Int) {
        seedCount += count
    }
    
    mutating func removeAllSeeds() -> Int {
        let seeds = seedCount
        seedCount = 0
        return seeds
    }
    
    var isEmpty: Bool {
        return seedCount == 0
    }
}
