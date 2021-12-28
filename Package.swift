// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShengjiTrackerEngine",
    products: [
        .library(
            name: "ShengjiTrackerEngine",
            targets: ["ShengjiTrackerEngine"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ShengjiTrackerEngine",
            dependencies: []
        ),
        .testTarget(
            name: "ShengjiTrackerEngineTests",
            dependencies: ["ShengjiTrackerEngine"]),
    ]
)