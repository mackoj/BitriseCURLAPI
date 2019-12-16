import XCTest
import BitriseCURLAPI
@testable import BitriseCURLAPIClientTests

final class BitriseCURLAPIClientTests: XCTestCase {
    func testExample() {
      let req = BitriseCURLAPIRequest(hookInfo: <#T##HookInfo?#>, buildParams: <#T##BuildParams?#>, triggeredBy: <#T##String?#>)
      
      let startBuild = try startBuild(accountID: "", body: req)
      XCTAssertThrows(try startBuild.parse(nil, nil).get())
      XCTAssertThrows(try startBuild.parse(invalidData, nil).get())
      XCTAssertNoThrow(try startBuild.parse(validData, nil).get())
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
