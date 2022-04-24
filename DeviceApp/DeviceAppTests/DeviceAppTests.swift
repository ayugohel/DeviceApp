//
//  DeviceAppTests.swift
//  DeviceAppTests
//
//  Created by Ayushi on 2022-04-21.
//

import XCTest
@testable import DeviceApp

class DeviceAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testJSONMapping() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "device_details", withExtension: "json") else {
            XCTFail("Missing file: transaction-details")
            return
        }
        let json = try Data(contentsOf: url)
        let decodedData = try JSONDecoder().decode(DataModel.self, from: json )
        XCTAssertEqual(decodedData.devices?.first?.title, "iPhone 12 mini")
        XCTAssertEqual(decodedData.devices?.first?.status, "Available")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
