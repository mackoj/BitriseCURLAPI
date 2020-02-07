// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BitriseCURLAPI",
  products: [
    .library(name: "BitriseCURLAPIClient", targets: ["BitriseCURLAPIClient"]),
    .library(
      name: "BitriseCURLAPI",
      targets: ["BitriseCURLAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/mackoj/tiny-networking", .branch("patch-1"))
  ],
  targets: [
    .target(
      name: "BitriseCURLAPIClient",
      dependencies: ["BitriseCURLAPI", "TinyNetworking"]),
    .target(name: "BitriseCURLAPI"),
    .testTarget(
      name: "BitriseCURLAPITests",
      dependencies: ["BitriseCURLAPI"]),
  .testTarget(
    name: "BitriseCURLAPIClientTests",
    dependencies: ["BitriseCURLAPIClient"]),
  ]
)
