# Kalah Game

A complete implementation of the Kalah (Mancala) board game in Swift for macOS command line, featuring modern Swift practices and Apple's ArgumentParser framework.

[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-macOS-lightgrey.svg)](https://developer.apple.com/macos/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 🎮 Overview

Kalah is a two-player strategy game where players take turns sowing seeds from their houses into adjacent pits and stores. The goal is to capture more seeds than your opponent through strategic moves and captures.

This implementation provides a complete, playable version with:
- **Full game logic** including sowing, capturing, and extra turns
- **Configurable board sizes** (5x4 or 7x5)
- **Flexible sowing directions** (clockwise or anti-clockwise)
- **Modern Swift architecture** with clean separation of concerns
- **ArgumentParser integration** for professional command-line interface
- **Swift Package Manager** for easy building and distribution

## 🚀 Features

### Game Features
- ✅ Complete Kalah rules implementation
- ✅ Seed sowing mechanics with proper direction handling
- ✅ Capture mechanics when landing in empty houses
- ✅ Extra turns when landing in player's store
- ✅ Game over detection and final scoring
- ✅ ASCII board display with clear visualization

### Technical Features
- ✅ Swift 5.0+ with modern language features
- ✅ Apple's ArgumentParser for command-line arguments
- ✅ Swift Package Manager for dependency management
- ✅ Clean architecture with MVC pattern
- ✅ Comprehensive input validation
- ✅ Error handling and user-friendly messages
- ✅ Cross-platform macOS compatibility

## 📋 Requirements

- **macOS** 10.15 (Catalina) or later
- **Swift** 5.0 or later
- **Xcode Command Line Tools** (for building)

## 🛠️ Installation

### Option 1: Build and Run with Swift Package Manager

1. **Clone the repository**
   ```bash
   git clone https://github.com/banghuazhao/Kalah.git
   cd Kalah
   ```

2. **Build the project**
   ```bash
   swift build -c release
   ```

3. **Run the game**
   ```bash
   .build/release/Kalah --help
   ```

### Option 2: Run Directly with Swift

```bash
git clone https://github.com/banghuazhao/Kalah.git
cd Kalah
swift run Kalah --help
```

## 🎯 Usage

### Basic Game
```bash
# Start a standard game (5 houses, 4 seeds, anti-clockwise)
swift run Kalah
# or if built: .build/release/Kalah
```

### Game Options
```bash
# 7 houses per player with 5 seeds each
swift run Kalah --seven-five

# Use clockwise sowing direction
swift run Kalah --clockwise

# Combine both options
swift run Kalah --seven-five --clockwise

# Show help
swift run Kalah --help
```

### Game Controls
- **House numbers**: Enter 1-5 (or 1-7 with `--seven-five`) to select a house
- **Quit**: Type `q` to exit the game
- **Invalid moves**: The game will prompt for valid input

## 🎲 Game Rules

### Basic Rules
1. **Setup**: Each player has 5 (or 7) houses with 4 (or 5) seeds each
2. **Turns**: Players take turns selecting one of their houses
3. **Sowing**: Seeds are distributed one by one into subsequent houses/stores
4. **Captures**: Landing in an empty house on your side captures opposite seeds
5. **Extra Turns**: Landing in your store grants an extra turn
6. **Game End**: When a player has no seeds in their houses

### Scoring
- Seeds in your store count as points
- Captured seeds are added to your store
- Remaining seeds are collected at game end
- Player with most seeds wins

### Detailed Rules

#### **Sowing Mechanics**
- When you select a house, all seeds from that house are picked up
- Seeds are distributed one by one in the chosen direction (clockwise or counter-clockwise)
- Distribution continues through your houses, your store, opponent's houses, and back to your houses
- Your opponent's store is skipped during sowing

#### **Capture Rules**
- If your last seed lands in an empty house on your side
- AND the opposite house (on opponent's side) has seeds
- You capture both the last seed and all seeds from the opposite house
- Captured seeds go directly to your store

#### **Extra Turns**
- If your last seed lands in your own store, you get an extra turn
- This can lead to multiple consecutive moves

#### **Game End Conditions**
- The game ends when the current player has no seeds in their houses
- Remaining seeds from both sides are collected into respective stores
- Final scores are compared to determine the winner

## 📺 Example Game Session

Here's a complete example of a Kalah game session:

```
Welcome to Kalah!
+----+-------+-------+-------+-------+-------+----+
| P2 | 5[ 4] | 4[ 4] | 3[ 4] | 2[ 4] | 1[ 4] |  0 |
|    |-------+-------+-------+-------+-------|    |
|  0 | 1[ 4] | 2[ 4] | 3[ 4] | 4[ 4] | 5[ 4] | P1 |
+----+-------+-------+-------+-------+-------+----+
Player P1's turn - Specify house number or 'q' to quit: 1

+----+-------+-------+-------+-------+-------+----+
| P2 | 5[ 4] | 4[ 4] | 3[ 4] | 2[ 4] | 1[ 4] |  0 |
|    |-------+-------+-------+-------+-------|    |
|  0 | 1[ 0] | 2[ 5] | 3[ 5] | 4[ 5] | 5[ 4] | P1 |
+----+-------+-------+-------+-------+-------+----+
Player P2's turn - Specify house number or 'q' to quit: 3

+----+-------+-------+-------+-------+-------+----+
| P2 | 5[ 4] | 4[ 4] | 3[ 0] | 2[ 4] | 1[ 4] |  0 |
|    |-------+-------+-------+-------+-------|    |
|  0 | 1[ 0] | 2[ 5] | 3[ 5] | 4[ 5] | 5[ 4] | P1 |
+----+-------+-------+-------+-------+-------+----+
Player P1's turn - Specify house number or 'q' to quit: 5

+----+-------+-------+-------+-------+-------+----+
| P2 | 5[ 4] | 4[ 4] | 3[ 0] | 2[ 4] | 1[ 4] |  0 |
|    |-------+-------+-------+-------+-------|    |
|  1 | 1[ 0] | 2[ 5] | 3[ 5] | 4[ 5] | 5[ 0] | P1 |
+----+-------+-------+-------+-------+-------+----+
Player P2's turn - Specify house number or 'q' to quit: q

Game over
+----+-------+-------+-------+-------+-------+----+
| P2 | 5[ 4] | 4[ 4] | 3[ 0] | 2[ 4] | 1[ 4] |  0 |
|    |-------+-------+-------+-------+-------|    |
|  1 | 1[ 0] | 2[ 5] | 3[ 5] | 4[ 5] | 5[ 0] | P1 |
+----+-------+-------+-------+-------+-------+----+
```

### Board Layout Explanation

The ASCII board shows:
- **Top row**: Player 2's houses (5, 4, 3, 2, 1) and store
- **Bottom row**: Player 1's houses (1, 2, 3, 4, 5) and store
- **Numbers in brackets**: Seed count in each house
- **Store values**: Total seeds captured by each player

### Move Examples

#### **Standard Move**
```
Player selects house 1 (4 seeds):
Before: 1[ 4] 2[ 4] 3[ 4] 4[ 4] 5[ 4]
After:  1[ 0] 2[ 5] 3[ 5] 4[ 5] 5[ 4]
```

#### **Capture Move**
```
Player lands in empty house 1, opposite house has seeds:
Capture: 1[ 0] + opposite house seeds → Player's store
```

#### **Extra Turn**
```
Player's last seed lands in their store:
Result: Player gets another turn immediately
```

## 🏗️ Architecture

The project follows a clean, modular architecture using Swift Package Manager:

```
Kalah/
├── Sources/
│   └── Kalah/
│       ├── Models/           # Core data structures
│       │   ├── House.swift   # Individual house representation
│       │   ├── Store.swift   # Player scoring areas
│       │   ├── Player.swift  # Player information
│       │   └── Board.swift   # Game board state management
│       ├── Game/             # Game logic engine
│       │   ├── GameEngine.swift      # Main game coordinator
│       │   ├── SowingEngine.swift    # Seed distribution logic
│       │   ├── PlayerManager.swift   # Turn management
│       │   └── GameStateManager.swift # Game state operations
│       ├── UI/               # User interface
│       │   ├── BoardDisplay.swift    # ASCII board rendering
│       │   └── InputHandler.swift    # User input processing
│       ├── Configuration/    # Game configuration
│       │   └── GameConfig.swift      # Game settings
│       ├── Kalah.swift       # Main game class
│       └── main.swift        # Entry point with ArgumentParser
├── Tests/
│   └── KalahTests/
│       └── KalahTests.swift  # Unit tests
├── Package.swift             # Swift Package Manager configuration
└── README.md                 # This file
```

### Key Components

- **`Kalah`**: Main game class that coordinates all components
- **`GameEngine`**: Manages the game loop and state transitions
- **`SowingEngine`**: Handles the core sowing mechanics and capture logic
- **`BoardDisplay`**: Renders the game board in ASCII format
- **`InputHandler`**: Processes and validates user input
- **`ArgumentParser`**: Provides professional command-line argument parsing

## 🧪 Testing

The project includes a comprehensive test suite with **50 unit tests** covering all aspects of the game to ensure reliability, correctness, and maintainability.

### **Test Coverage**

#### **Test Suites (9 total)**
- ✅ **HouseTests**: House mechanics, seed management, emptiness checks
- ✅ **StoreTests**: Store functionality, seed addition, initialization
- ✅ **PlayerTests**: Player management, initialization, identification
- ✅ **GameConfigTests**: Game configuration options (5x4, 7x5, directions)
- ✅ **BoardTests**: Board setup, seed distribution, capture mechanics
- ✅ **SowingEngineTests**: Core sowing logic, store landing, capture scenarios
- ✅ **GameEngineTests**: Game flow, move validation, turn management
- ✅ **IntegrationTests**: Complete game scenarios, capture mechanics, extra turns
- ✅ **EdgeCaseTests**: Boundary conditions, minimum configurations
- ✅ **DebugTests**: Troubleshooting and debugging scenarios

#### **Test Statistics**
- **Total Tests**: 50
- **Test Suites**: 9
- **Coverage**: All major components and game scenarios
- **Status**: All tests passing ✅

### **Running Tests**

#### **Command Line**
```bash
# Run all tests
swift test

# Run tests with verbose output
swift test --verbose

# Run specific test suite
swift test --filter HouseTests
swift test --filter GameEngineTests
swift test --filter IntegrationTests

# Run specific test
swift test --filter GameEngineTests/testMoveWithEmptyHouse
swift test --filter SowingEngineTests/testSowingWithCapture
```

#### **Test Structure**
```
Tests/
└── KalahTests/
    └── KalahTests.swift      # All unit tests organized by component
```

### **Test Scenarios Covered**

#### **Core Game Mechanics**
- **House Operations**: Initialization, seed addition/removal, emptiness checks
- **Store Operations**: Seed collection, scoring, initialization
- **Player Management**: Turn switching, player identification
- **Board Setup**: Default and custom configurations, seed distribution

#### **Game Logic**
- **Sowing Mechanics**: Simple sowing, store landing, board traversal
- **Capture Logic**: Empty house detection, opposite house capture
- **Turn Management**: Valid/invalid moves, turn switching, extra turns
- **Game State**: Game over detection, final scoring, game ending

#### **Integration Scenarios**
- **Complete Game Flow**: Multi-move sequences, player interactions
- **Capture Scenarios**: Complex capture mechanics, multiple captures
- **Extra Turn Logic**: Store landing, consecutive moves
- **Configuration Variations**: Different board sizes and sowing directions

#### **Edge Cases & Error Handling**
- **Invalid Moves**: Empty house selection, out-of-bounds input
- **Boundary Conditions**: Minimum configurations, maximum scenarios
- **Game End Conditions**: No valid moves, forced game termination
- **Input Validation**: Error handling, user input processing

### **Test Quality Features**
- **Descriptive Names**: Clear test names explaining what is being tested
- **Independent Tests**: Each test can run in isolation
- **Comprehensive Assertions**: Multiple checks per test for thorough validation
- **Real Game Scenarios**: Tests based on actual gameplay situations
- **Debug Support**: Specialized tests for troubleshooting complex issues

### **Continuous Integration Ready**
The test suite is designed to work seamlessly with CI/CD pipelines:
- Fast execution (< 1 second for all tests)
- No external dependencies
- Clear pass/fail reporting
- Comprehensive coverage reporting

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Commands
```bash
# Build the project
swift build

# Run tests
swift test

# Run the game
swift run Kalah

# Clean build artifacts
swift package clean
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Based on the traditional Kalah/Mancala board game
- Uses Apple's [ArgumentParser](https://github.com/apple/swift-argument-parser) framework
- Built with modern Swift best practices and Swift Package Manager

## 📞 Support

If you encounter any issues or have questions:
- Open an issue on [GitHub](https://github.com/banghuazhao/Kalah/issues)
- Check the existing issues for solutions

---

**Enjoy playing Kalah!** 🎮
