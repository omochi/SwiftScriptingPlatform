import XCTest
@testable import SwiftScriptingPlatform

class SwiftScriptingPlatformTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SwiftScriptingPlatform().text, "Hello, World!")
    }


    static var allTests : [(String, (SwiftScriptingPlatformTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
