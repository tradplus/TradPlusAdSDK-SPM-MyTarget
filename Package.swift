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
            .exact("15.15.0")
        ),
        .package(
            url: "https://github.com/myTargetSDK/mytarget-ios-spm.git",
            .exact("5.46.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-MyTarget/releases/download/15.15.0/TPMyTargetAdapter-15.15.0.xcframework.zip",
            checksum: "3934efb529e4de9f31471fd21ed5507dff998ded5cd68c73c0e6dfc8988ce119"
        ),
    ]
)
