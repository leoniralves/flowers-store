//
//  FlowerListViewTests.swift
//  FlowersStoreTests
//
//  Created by Kaue on 10/11/21.
//

import XCTest
@testable import FlowersStore

class FlowersListViewTests: XCTestCase {
    private var sut: FlowersListView = .init()
    
    func test_init_collectionViewIsNotNil() {
        
        XCTAssertNotNil(sut.collectionView)
    }

}
