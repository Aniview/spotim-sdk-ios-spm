// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "10.14.0"),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK", from: "1.11.0") //,
        // .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios", from: "3.1.0"), // AdPlayerSDK
    ],
    targets: [
        .target(
            name: "SpotImStandaloneAdsTarget",
            dependencies: [
                .target(name: "SpotImStandaloneAds"),
                .target(name: "KmmSpotimStandaloneAd"),
                .target(name: "SpotImStandaloneAdsDynamic"),
                .target(name: "OpenWrapTarget"),
                .target(name: "AdPlayerSDKTarget"),
                .product(name: "AppHarbrSDK", package: "AppHarbrSDK")
            ]
        ),
        .target(
            name: "OpenWrapTarget",
            dependencies: [
                .target(name: "OMSDK_Pubmatic"),
                .target(name: "OpenWrapSDK"),
                .target(name: "OpenWrapMeasurement"),
                .target(name: "OpenWrapHandlerDFP"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ]
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
        ),
        .target(
            name: "AdPlayerSDKTarget",
            dependencies: [
                .target(name: "AdPlayerSDK") //,
               // .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios")
            ]
        ),
        .binaryTarget(
            name: "AdPlayerSDK",
            path: "downloads/AdPlayerSDK.xcframework"
        )
    ]
)
