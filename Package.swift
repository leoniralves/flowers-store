// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flowers-store",
    products: [
        .library(
            name: "DangerDeps",
            type: .dynamic,
            targets: ["DangerDependencies"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/danger/swift.git",
            from: "3.11.1"),
        .package(
            url: "https://github.com/f-meloni/danger-swift-coverage.git",
            from: "1.2.1"),
        .package(
            url: "https://github.com/f-meloni/danger-swift-xcodesummary",
            from: "1.2.1"),
        .package(
            url: "https://github.com/taji-taji/DangerSwiftPeriphery.git",
            from: "1.0.0")
    ],
    targets: [
        .target(
            name: "DangerDependencies",
            dependencies: [
                "Danger",
                "DangerSwiftCoverage",
                "DangerXCodeSummary",
                "DangerSwiftPeriphery"
            ],
            path: "DangerDeps"),
    ]
)