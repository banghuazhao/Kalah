// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Kalah",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.6.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Kalah",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
        ),
        .testTarget(
            name: "KalahTests",
            dependencies: ["Kalah"]
        ),
    ]
)
