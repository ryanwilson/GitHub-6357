// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// This Package.swift is a Work in Progress. We intend to keep it functional
// on the master branch, but it is rapidly evolving and may have occasional
// breakages. Please report any issues at
// https://github.com/firebase/firebase-ios-sdk/issues/new/choose.

import PackageDescription

let package = Package(
  name: "GitHub-6357",
  platforms: [ .macOS(.v11) ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "GitHub-6357",
      targets: ["GitHub-6357"]),
  ],
  dependencies: [
    // "DummyFirebase" is another repo that names their package "Firebase".

    // First try: use the name specified in the Package manifest. Errors with duplicate names.
//    .package(name: "Firebase", url: "https://github.com/ryanwilson/DummyFirebasePackage.git", .branch("main")),

    // Second try: rename like it suggested. Errors with incorrect name.
    .package(name: "DummyFirebase", url: "https://github.com/ryanwilson/DummyFirebasePackage.git", .branch("main")),

    // The legitimate Firebase dependency.
    .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", .branch("6.33-spm-beta")),
  ],
  targets: [
    .target(
      name: "GitHub-6357",
      dependencies: [
        // From the `DummyFirebasePackage` repo.

        // First try: Actual name. Fails with duplicate package name.
//        .product(name: "DummyFirebasePackage", package: "Firebase"),

        // Second try: renamed. Fails as well.
        .product(name: "DummyFirebasePackage", package: "DummyFirebase"),

        // From the `firebase-ios-sdk` repo.
        .product(name: "FirebaseAuth", package: "Firebase"),
      ]),
  ]
)
