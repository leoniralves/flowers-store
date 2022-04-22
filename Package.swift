// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flowers-store",
    products: [
        .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"]), // dev
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/danger/swift.git", from: "3.11.1"), // dev
    .package(url: "https://github.com/f-meloni/danger-swift-coverage.git", from: "1.2.1"), // dev
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "DangerDependencies", dependencies: ["Danger", "DangerSwiftCoverage"], path: "DangerDeps"),
    ]
)
