// RUN: %target-swift-frontend -emit-ir  -disable-availability-checking %s | %FileCheck -check-prefix CHECK -check-prefix CHECK-%target-cpu -check-prefix CHECK-%target-import-type %s
// REQUIRES: concurrency

// Make sure that the protocol requirement descriptor includes the async flag.
// CHECK: @"$s23protocol_req_descriptor12RepoProtocolMp" = {{.*}}%swift.protocol_requirement { i32 34, i32 0 }, %swift.protocol_requirement { i32 49, i32 0 } }>
protocol RepoProtocol {
 init() async
 func run() async
}

actor Impl: RepoProtocol {
  init() async {}
  func run() async {}
}
