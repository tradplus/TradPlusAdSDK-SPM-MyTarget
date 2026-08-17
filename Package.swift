// swift-tools-version:5.3

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
            .exact("15.13.0")
        ),
        .package(
            url: "https://github.com/myTargetSDK/mytarget-ios-spm.git",
            .exact("5.45.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-MyTarget/releases/download/15.13.0/TPMyTargetAdapter-15.13.0.xcframework.zip",
            checksum: "a402ca8147ad18f87949a3c4e84085420e884c742d95d53e1ee8c31b3cf62085"
        ),
    ]
)
