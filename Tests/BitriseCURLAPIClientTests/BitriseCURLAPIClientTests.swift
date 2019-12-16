import XCTest
import BitriseCURLAPI
import TinyNetworking
@testable import BitriseCURLAPIClient

final class BitriseCURLAPIClientTests: XCTestCase {
    func testExample() {
      let invalidData = Data()
      let validData = Data()
      let req = BitriseCURLAPIRequest(
        hookInfo: HookInfo(
          type: "bitrise",
          buildTriggerToken: "123"
        ),
        buildParams: BuildParams(
          branch: "pika",
          workflowid: "chuuu",
          environments: [
            Environment(
              mappedTo: "FUTURE_VERSION",
              value: "12345",
              isExpand: true
            )
          ]
        ),
        triggeredBy: "android_deployer"
      )
      
      XCTAssertThrowsError(try startBuild(accountID: "456", body: req).parse(nil, nil).get())
      XCTAssertThrowsError(try startBuild(accountID: "456", body: req).parse(invalidData, nil).get())
      XCTAssertNoThrow(try startBuild(accountID: "456", body: req).parse(validData, nil).get())
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
