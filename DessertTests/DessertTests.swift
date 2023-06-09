//
//  DessertTests.swift
//  DessertTests
//
//  Created by Jessica Sendejo on 4/25/23.
//

import XCTest
@testable import Dessert

final class DessertTests: XCTestCase {
    
    //Test to see if the FetchDesserts are returning a count greater than 0
    func testFetchDesserts() async throws {
        let desserts = try await FetchDesserts.getDesserts()
        XCTAssertGreaterThan(desserts.count, 0)
    }
    
    //Test to see if the dessertDetails is returning a count greater than 0
    func testFetchDessertDetails() async throws {
        let desserts = try await FetchDesserts.getDesserts()
        let details = try await FetchDesserts.getDessertDetails(id: desserts[0].idMeal)
        XCTAssertGreaterThan(details.count, 0)
    }
    

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
