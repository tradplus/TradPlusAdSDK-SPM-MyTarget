// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TradPlusMyTargetAdapter",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "TradPlusMyTargetAdapter",
            targets: ["TradPlusMyTargetAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/myTargetSDK/mytarget-ios-spm.git",
            .exact("5.47.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusMyTargetAdapter",
            dependencies: [
                .target(name: "TPMyTargetAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "MyTargetSDK", package: "mytarget-ios-spm"),
            ],
            path: ".",
            sources: ["Sources/TradPlusMyTargetAdapter/TradPlusMyTargetAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPMyTargetAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-MyTarget/releases/download/15.18.0/TPMyTargetAdapter-15.18.0.xcframework.zip",
            checksum: "31ba734491826b2d76d1b84aae833037df458db58148484a03c4ff5f11e023d3"
        ),
    ]
)
