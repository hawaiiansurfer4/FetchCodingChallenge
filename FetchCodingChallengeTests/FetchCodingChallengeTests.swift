//
//  FetchCodingChallengeTests.swift
//  FetchCodingChallengeTests
//
//  Created by Sean Murphy on 7/29/24.
//

import XCTest
@testable import FetchCodingChallenge

final class FetchCodingChallengeTests: XCTestCase {

    var vm: DessertViewModel?
    var networkManager: NetworkManager?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = DessertViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
    }

    func testDataNotNil() throws {
        let startingURL = ""
        networkManager?.fetchData(with: startingURL, completion: { data, error in
            if let data = data {
                XCTAssertNotNil(data)
            }
        })
    }
    
    func testErrorIsNil() throws {
        let startingURL = ""
        networkManager?.fetchData(with: startingURL, completion: { data, error in
            XCTAssertNil(error)
        })
    }
    
    func testErrorNotNil() throws {
        let startingURL = ""
        networkManager?.fetchData(with: startingURL, completion: { data, error in
            XCTAssertNotNil(error)
        })
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
