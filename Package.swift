// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let adPlayerVersion = "1.9.2"

let package = Package(
    name: "spotim-sdk-ios-spm",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "SpotImStandaloneAds",
            targets: [
                "SpotImStandaloneAdsTarget"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Aniview/ad-player-sdk-ios-pods.git", from: Version(stringLiteral: adPlayerVersion)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "10.14.0"),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK", from: "1.10.0")
    ],
    targets: [
        .target(
            name: "SpotImStandaloneAdsTarget",
            dependencies: [
                .target(name: "SpotImStandaloneAds"),
                .target(name: "KmmSpotimStandaloneAd"),
                .target(name: "SpotImStandaloneAdsDynamic"),
                .target(name: "OpenWrapTarget"),
                .product(name: "AdPlayerSDK", package: "ad-player-sdk-ios-pods"),
                .product(name: "AppHarbrSDK", package: "AppHarbrSDK")
            ],
            path: "sources",
            linkerSettings: [.unsafeFlags(["-ObjC"])]
        ),
        .target(
            name: "OpenWrapTarget",
            dependencies: [
                .target(name: "OMSDK_Pubmatic"),
                .target(name: "OpenWrapSDK"),
                .target(name: "OpenWrapMeasurement"),
                .target(name: "OpenWrapHandlerDFP"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "sourcesOW",
            linkerSettings: [.unsafeFlags(["-ObjC"])]
        ),
        .binaryTarget(
            name: "SpotImStandaloneAds",
            path: "downloads/SpotImStandaloneAds.xcframework"
        ),
        .binaryTarget(
            name: "SpotImStandaloneAdsDynamic",
            path: "downloads/SpotImStandaloneAdsDynamic.xcframework"
        ),
        .binaryTarget(
            name: "KmmSpotimStandaloneAd",
            path: "downloads/KmmSpotimStandaloneAd.xcframework"
        ),
        .binaryTarget(
            name: "OMSDK_Pubmatic",
            path: "downloads/OpenWrapSDK/OMSDK_Pubmatic.xcframework"
        ),
        .binaryTarget(
            name: "OpenWrapSDK",
            path: "downloads/OpenWrapSDK/OpenWrapSDK.xcframework"
        ),
        .binaryTarget(
            name: "OpenWrapMeasurement",
            path: "downloads/OpenWrapSDK/OpenWrapMeasurement.xcframework"
        ),
        .binaryTarget(
            name: "OpenWrapHandlerDFP",
            path: "downloads/OpenWrapHandlers/OpenWrapHandlerDFP.xcframework"
        )
    ]
)
