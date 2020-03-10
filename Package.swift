// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BitriseCURLAPI",
  products: [
    .library(name: "BitriseCURLAPIClient", targets: ["BitriseCURLAPIClient"]),
    .library(name: "BitriseCURLAPI", targets: ["BitriseCURLAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.1.0"),
  ],
  targets: [
    .target(name: "BitriseCURLAPI"),
    .target(
      name: "BitriseCURLAPIClient",
      dependencies: ["BitriseCURLAPI", "AsyncHTTPClient"]),
    .testTarget(
      name: "BitriseCURLAPIClientTests",
      dependencies: ["BitriseCURLAPIClient"]),
  ]
)
