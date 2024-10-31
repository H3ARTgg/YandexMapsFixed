// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMapsFixed",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "YandexMapsFixed",
            targets: ["YandexMapsFixed"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "YandexMapsMobile",
            url: "https://github.com/c-villain/YandexMapsMobile/releases/download/4.8.1/YandexMapsMobile.xcframework.zip",
            checksum: "dc0ba45bfc47f0c3bd3f864a7a047981b512f4def9960a2e421eef90936cb465"
        ),
        .target(
            name: "YandexMapsFixed",
            dependencies: ["YandexMapsMobile"],
            linkerSettings: [
                .unsafeFlags(["-ObjC"]),
                .linkedFramework("DeviceCheck")
            ]
        )
    ]
)
