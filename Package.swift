// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BitriseCURLAPI",
  products: [
    .library(
      name: "BitriseCURLAPI",
      targets: ["BitriseCURLAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/objcio/tiny-networking", .branch("master"))
  ],
  targets: [
    .target(
      name: "BitriseCURLAPI",
      dependencies: ["TinyNetworking"]),
    .testTarget(
      name: "BitriseCURLAPITests",
      dependencies: ["BitriseCURLAPI"]),
  ]
)
