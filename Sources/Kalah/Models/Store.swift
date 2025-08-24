//
// Created by Banghua Zhao on 23/08/2025
// Copyright Apps Bay Limited. All rights reserved.
//

import Foundation

struct Store {
    private(set) var seedCount: Int
    
    init() {
        self.seedCount = 0
    }
    
    mutating func addSeed() {
        seedCount += 1
    }
    
    mutating func addSeeds(_ count: Int) {
        seedCount += count
    }
    
    var isEmpty: Bool {
        return seedCount == 0
    }
}
