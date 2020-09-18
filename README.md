# GitHub-6357

A repro of https://github.com/firebase/firebase-ios-sdk/issues/6357.

Steps to reproduce:

1. Run `swift build`. Observe error:

```
"error: duplicate dependency named 'Firebase'; consider differentiating them using the 'name' argument"
```

2. Comment out the lines below "First try" that refer to the DummyFirebase repo as "Firebase", then
   uncomment the lines for "Second try" that refer to the DummyFirebabse repo as "DummyFirebase".

3. Run `swift build` again. It tries to update dependencies twice, has an unrelated error, then
   has an error that the updated name argument doesn't match the actual package name.

```
Updating https://github.com/ryanwilson/DummyFirebasePackage.git
Updating https://github.com/firebase/firebase-ios-sdk.git
Updating https://github.com/firebase/abseil-cpp.git
Updating https://github.com/firebase/grpc.git
Updating https://github.com/firebase/leveldb.git
Updating https://github.com/nanopb/nanopb.git
Updating https://github.com/firebase/boringssl.git
Updating https://github.com/google/gtm-session-fetcher.git
Updating https://github.com/google/promises.git
Everything is already up-to-date
Updating https://github.com/ryanwilson/DummyFirebasePackage.git
Updating https://github.com/firebase/firebase-ios-sdk.git
Updating https://github.com/firebase/abseil-cpp.git
Updating https://github.com/firebase/grpc.git
Updating https://github.com/firebase/leveldb.git
Updating https://github.com/nanopb/nanopb.git
Updating https://github.com/firebase/boringssl.git
Updating https://github.com/google/gtm-session-fetcher.git
Updating https://github.com/google/promises.git
Everything is already up-to-date
error: the Package.resolved file is most likely severely out-of-date and is preventing correct resolution; delete the resolved file and try again
'GitHub-6357' /Users/wilsonryan/Code/GitHub-6357: error: declared name 'DummyFirebase' for package dependency 'https://github.com/ryanwilson/DummyFirebasePackage.git' does not match the actual package name 'Firebase'
Fatal error: Duplicate values for key: 'DummyFirebasePackage': file /AppleInternal/BuildRoot/Library/Caches/com.apple.xbs/Sources/swiftlang/swiftlang-1103.8.25.8/swift/stdlib/public/core/NativeDictionary.swift, line 747
Illegal instruction: 4

```
