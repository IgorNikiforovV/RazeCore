//
//  RazeNetworkingTests.swift
//  RazeCoreTests
//
//  Created by Игорь Никифоров on 19.03.2021.
//

import XCTest
@testable import RazeCore

final class RazeNetworkingTests: XCTestCase {
    class NetworkSessionMock: NetworkSession {
        var data: Data?
        var error: Error?

        func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
            completionHandler(data, error)
        }
    }

    func testLoadDataCall() {
        let  manager = RazeCore.Networking.Manager()
        let session  = NetworkSessionMock()
        manager.session = session
        let expectation = XCTestExpectation(description: "Call for data")
        let data = Data([0, 1, 0, 1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
                case .success(let returnedData):
                    XCTAssertEqual(data, returnedData, " ")
                case .failure(let error):
                    XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }

    static var allTests = [
        ("testLoadDataCall", testLoadDataCall)
    ]

}
