//
//  FlowerListViewControllerTests.swift
//  FlowersStoreTests
//
//  Created by Magno Ferreira on 10/11/21.
//

import Foundation
import XCTest
@testable import FlowersStore

final class FlowerListViewControllerTests: XCTestCase {
    
    private lazy var sut: FlowersListViewController = {
        let sut: FlowersListViewController = .init()
        sut.loadViewIfNeeded()
        return sut
    }()

    func test_loadView_checkIfViewTypeIsFlowerListView() {
        XCTAssertTrue(sut.view is FlowersListView)
    }
}
