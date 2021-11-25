//
//  FlowerTests.swift
//  FlowersStoreTests
//
//  Created by Leonir on 24/11/21.
//

import XCTest
@testable import FlowersStore

final class FlowerTests: XCTestCase {
    
    func test_() {
        let flowerArray: [Flower]? = decodeFlowerJSON()
        let sut: Flower = XCTUnwrap(flowerArray?.first)

        XCTAssertEqual(sut.name, "Rosa")
    }
    
    private func decodeFlowerJSON() -> [Flower]? {
        if let path = Bundle.main.url(forResource: "flowers", withExtension: "json"),
           let jsonData = try? Data(contentsOf: path),
           let flowers = try? JSONDecoder().decode([Flower].self, from: jsonData) {
            return flowers
        }
        return nil
    }
}
