// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "V2MacCore",
    platforms: [.macOS(.v15)],
    products: [
        .library(name: "V2MacCore", targets: ["V2MacCore"]),
    ],
    targets: [
        .target(name: "V2MacCore"),
        .testTarget(name: "V2MacCoreTests", dependencies: ["V2MacCore"]),
    ]
)
