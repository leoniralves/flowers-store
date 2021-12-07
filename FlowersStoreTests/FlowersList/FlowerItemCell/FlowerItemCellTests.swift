//
//  FlowerItemCellTests.swift
//  FlowersStoreTests
//
//  Created by Magno Ferreira on 02/12/21.
//

import XCTest
@testable import FlowersStore

final class FlowerItemCellTests: XCTestCase {
    // MARK: - Properties
    private let flowerItemCellDelegateSpy: FlowerItemCellDelegateSpy = .init()
    private let sut: FlowerItemCell = .init(frame: .zero)
    
    // MARK: - Test Methods
    func test_didTapFavoriteButton_whenUserTouchUpInsideButton_andFlowerIsNotNil_shouldCallFavoriteDelegate() {
        let dummy: Flower = .make()
        
        sut.setup(flower: dummy, delegate: flowerItemCellDelegateSpy)
        sut.favoriteButton.tap()
        
        thenAssertFlowerIs(flower: dummy)
    }
}

extension FlowerItemCellTests {
    func thenAssertFlowerIs(
        flower: Flower,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        guard flowerItemCellDelegateSpy.verifyDidTapFavoriteButton.wasCalledOnce() else {
            return
        }
        
        XCTAssertEqual(
            flowerItemCellDelegateSpy.verifyDidTapFavoriteButton.getArgument(),
            flower,
            file: file,
            line: line
        )
    }
}

extension UIButton {
    func tap() {
        self.sendActions(for: .touchUpInside)
    }
}

extension Flower {
    static func make(
        id: Int = 1,
        name: String = "dummyName",
        image: String = "dummyImage",
        isFavorite: Bool = false
    ) -> Self {
        .init(
            id: id,
            name: name,
            image: image,
            isFavorite: isFavorite
        )
    }
}
