// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "RevoForms",
    platforms: [
        .iOS(.v11_3)
    ],
    products: [
        .library(
            name: "RevoForms",
            type: .static,
            targets: ["RevoForms"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/revosystems/RevoValidation.git", .upToNextMinor(from: "0.1.0"))
    ],
    targets: [
        .target(
            name: "RevoForms",
            dependencies: ["RevoValidation"],
            path: "forms/lib"
        )
    ],
    swiftLanguageVersions: [.v5]
)
