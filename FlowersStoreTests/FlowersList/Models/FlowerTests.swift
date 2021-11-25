//
//  FlowerTests.swift
//  FlowersStoreTests
//
//  Created by Leonir on 24/11/21.
//

import XCTest
@testable import FlowersStore

final class FlowerTests: XCTestCase {
    
    func test_flowerModel_shouldReturnPropertiesTypeSuccessfully() throws {
        let flowerArray: [Flower]? = decodeFlowerJSON()
        let sut: Flower = try XCTUnwrap(flowerArray?.first)

        XCTAssertEqual(sut.name, "Rosa")
        XCTAssertFalse(sut.image.isEmpty)
        XCTAssertTrue(sut.isFavorite)
    }
    
    private func decodeFlowerJSON() -> [Flower]? {
        guard let path = Bundle(for: Self.self).url(forResource: "flowers", withExtension: "json") else {
            return nil
        }
        
        guard let jsonData = try? Data(contentsOf: path) else {
            return nil
        }
        
        if let flowers = try? JSONDecoder().decode([Flower].self, from: jsonData) {
            return flowers
        }
        
        return nil
    }
}
