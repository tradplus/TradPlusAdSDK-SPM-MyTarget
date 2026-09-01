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
            .exact("15.14.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-MyTarget/releases/download/15.14.0/TPMyTargetAdapter-15.14.0.xcframework.zip",
            checksum: "28d39c9f4eea4ebe1d61058a6679e5fb70c9e82a1d4c2181c8b297e2db5aec7b"
        ),
    ]
)
