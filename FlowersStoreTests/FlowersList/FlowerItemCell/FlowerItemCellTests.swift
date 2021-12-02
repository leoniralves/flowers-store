//
//  FlowerItemCellTests.swift
//  FlowersStoreTests
//
//  Created by Magno Ferreira on 02/12/21.
//

import XCTest
@testable import FlowersStore

final class FlowerItemCellDelegateSpy: FlowerItemCellDelegate {
    
    @VerifyMethodArgs<Flower>
    private(set) var verifyDidTapFavoriteButton
    
    func didTapFavoriteButton(flower: Flower) {
        verifyDidTapFavoriteButton.append(args: flower)
    }
    
}

final class FlowerItemCellTests: XCTestCase {
    
    private let flowerItemCellDelegateSpy: FlowerItemCellDelegateSpy = .init()
    private let sut: FlowerItemCell = .init(frame: .zero)
    
    func test_didTapFavoriteButton_() {
        
        sut.setup(flower: .make(), delegate: flowerItemCellDelegateSpy)
        sut.favoriteButton.tap()
        flowerItemCellDelegateSpy.verifyDidTapFavoriteButton.wasCalledOnce()
        XCTAssertEqual(flowerItemCellDelegateSpy.verifyDidTapFavoriteButton.getArgument(), .make())
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
