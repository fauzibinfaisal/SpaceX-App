//
//  rocketappTests.swift
//  rocketappTests
//
//  Created by Gop-c2s2-f on 10/02/23.
//

import XCTest
@testable import rocketapp

class rocketappTests: XCTestCase {
    
    func testFetchRockets() {
        let service = RocketService()
        let expectation = XCTestExpectation(description: "fetch rockets from service")
        
        service.fetchRocketList { (result) in
            switch result {
            case .success(let rockets):
                XCTAssert(rockets.count > 0)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchRocketDetail() {
        let service = RocketService()
        let expectation = XCTestExpectation(description: "fetch rocket detail from service")
        let id = "5e9d0d95eda69974db09d1ed"
        
        service.fetchRocket(id: id) { (result) in
            switch result {
            case .success(let rocket):
                XCTAssertEqual(rocket.id, id)
                XCTAssertNotNil(rocket.name)
                XCTAssertNotNil(rocket.description)
                XCTAssertNotNil(rocket.costPerLaunch)
                XCTAssertNotNil(rocket.country)
                XCTAssertNotNil(rocket.mass)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testRocketListViewModelFetchRockets() {
        let viewModel = RocketListViewModel()
        let expectation = self.expectation(description: "fetch rocket list from VM")
        
        viewModel.state = .loading
        viewModel.fetchRockets()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if case .success(let rockets) = viewModel.state {
                XCTAssert(rockets.count > 0, "Rocket list should not be empty")
                expectation.fulfill()
            } else {
                XCTFail("Rocket list fetch failed")
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testRocketDetailViewModelFetchRocketDetail() {
        let viewModel = RocketDetailViewModel(rocketId: "5e9d0d95eda69974db09d1ed")
        let expectation = self.expectation(description: "fetch rocket detail from VM")
        
        viewModel.state = .loading
        viewModel.fetchRocketDetail()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if case .success(let rocketDetail) = viewModel.state {
                XCTAssert(rocketDetail.name.count > 0, "Rocket detail should not be empty")
                expectation.fulfill()
            } else {
                XCTFail("Rocket detail fetch failed")
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}


