// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NuggetSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "NuggetSDK",
            targets: ["NuggetSDK"]),
    ],
    dependencies: [
        // Dependencies previously managed by NuggetExternalDependency, now direct
        .package(url: "https://github.com/patchthecode/JTAppleCalendar", .exact("8.0.5")),
        .package(url: "https://github.com/kean/Nuke.git", .exact("10.7.1"))
    ],
    targets: [
        // Main Nugget binary
        .binaryTarget(
            name: "Nugget",
            url: "https://github.com/pranavzmt/nugget-sdk-ios/releases/download/99.0.0-NuggetCode/Nugget.xcframework.zip",
            checksum: "df3cb0cecbad05915bdca09d0513d9325a03b9e954a02d7d8ee66b83e57e7ed8"
        ),
        // Binary targets previously for NuggetInternalDependency, now direct dependencies for NuggetSDK
        .binaryTarget(
            name: "NuggetFoundation",
            url: "https://github.com/Zomato-Nugget/nugget-sdk-ios/releases/download/0.0.2-Foundation/NuggetFoundation.xcframework.zip",
            checksum: "bac60616a9c27b2fb2d5564324be369c75d6460238891e7f7163dcafe3516922"
        ),
        .binaryTarget(
            name: "NuggetJumbo",
            url: "https://github.com/Zomato-Nugget/nugget-sdk-ios/releases/download/0.0.2-Jumbo/NuggetJumbo.xcframework.zip",
            checksum: "7ba9883d3361002b33d9e093e6b67fabddea03180410f5aedfa3e6ab44e4a83a"
        ),
        .binaryTarget(
            name: "NuggetApiManager",
            url: "https://github.com/pranavzmt/nugget-sdk-ios/releases/download/99.0.1-NuggetApiManager/ZApiManager.xcframework.zip",
            checksum: "c0739d668a823ece16357bd85dbe514b6e3b3ed2063a3dcd46f4e71c124cd7f3"
        ),
        .target(
            name: "NuggetSDK",
            dependencies: [
                "Nugget", // Main binary
                // Binaries from former NuggetInternalDependency
                "NuggetFoundation",
                "NuggetJumbo",
                "NuggetApiManager",
                // Products from former NuggetExternalDependency
                .product(name: "JTAppleCalendar", package: "JTAppleCalendar"),
                .product(name: "Nuke", package: "Nuke")
            ]
        ),
        .testTarget(
            name: "NuggetSDKTests",
            dependencies: ["NuggetSDK"]),
    ]
)
