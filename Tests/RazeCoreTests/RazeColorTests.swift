import XCTest
@testable import RazeCore

final class RazeColorTests: XCTestCase {

    func testColorRedEqual() {
        let color = RazeCore.Color.fromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }

    func testRizeColorsAreEqual() {
        let color = RazeCore.Color.fromHexString("006736")
        XCTAssertEqual(color, RazeCore.Color.razeColor)
    }

    func testSecondaryRazeColorsAreEqual() {
        let color = RazeCore.Color.fromHexString("FCFFFD")
        XCTAssertEqual(color, RazeCore.Color.secondaryRazeColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testRizeColorsAreEqual", testRizeColorsAreEqual),
        ("testSecondaryRazeColorsAreEqual", testSecondaryRazeColorsAreEqual),
    ]
}
