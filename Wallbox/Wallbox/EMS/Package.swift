// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EMS",
    platforms: [
      .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "EMS",
            targets: ["EMS"]),
    ],
    dependencies: [
      .package(path: "../WallboxCommon"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "EMS",
            dependencies: ["WallboxCommon"],
            resources: [.process("Resources/live_data.json"),
                        .process("Resources/historic_data.json")]),
        .testTarget(
            name: "EMSTests",
            dependencies: ["EMS", "WallboxCommon"]),
    ]
)
