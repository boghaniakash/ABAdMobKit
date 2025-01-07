// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ABAdMobKit",
    products: [
        .library(
            name: "ABAdMobKit",
            targets: ["ABAdKit"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            .upToNextMajor(from: "11.13.0")
        )
    ],
    targets: [
        .binaryTarget(
            name: "ABAdBinaryKit",
            path: "Sources/Frameworks/ABAdKit.xcframework"
        ),
        .target(
            name: "ABAdKit",
            dependencies: [
                .target(name: "ABAdBinaryKit"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "Sources/ABAdKit"
        )
    ]
)
