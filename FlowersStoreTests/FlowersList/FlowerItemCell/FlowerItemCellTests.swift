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
    private let imageDownloadProtocolSpy: ImageDownloadProtocolSpy = .init()
    
    // MARK: - Test Methods
    func test_didTapFavoriteButton_whenSetupNeverCalled_shouldNeverCallFavoriteDelegate() {
        sut.favoriteButton.tap()
        
        flowerItemCellDelegateSpy.verifyDidTapFavoriteButton.wasNeverCalled()
    }
    
    func test_didTapFavoriteButton_whenSetupCalled_withDelegateNil_shouldNeverCallFavoriteDelegate() {
        let dummy: Flower = .make()
        sut.setup(flower: dummy, imageDownloadProtocol: nil, delegate: nil)
        
        sut.favoriteButton.tap()
        
        flowerItemCellDelegateSpy.verifyDidTapFavoriteButton.wasNeverCalled()
    }
    
    func test_didTapFavoriteButton_whenSetupCalled_shouldCallFavoriteDelegate() {
        let dummy: Flower = .make()
        
        sut.setup(flower: dummy, imageDownloadProtocol: nil, delegate: flowerItemCellDelegateSpy)
        sut.favoriteButton.tap()
        
        thenAssertFlowerIs(flower: dummy)
    }
    
    func test_setup_whenFlowerIsNotNil_andFlowerPropertiesAreValid_shouldSetupCellLayout() {
        let dummyImage: UIImage = UIImage()
        let dummy: Flower = .make()
        
        imageDownloadProtocolSpy.getImageToBeReturned = dummyImage
        
        sut.setup(
            flower: dummy,
            imageDownloadProtocol: imageDownloadProtocolSpy,
            delegate: flowerItemCellDelegateSpy
        )
        
        XCTAssertNotNil(sut.titleLabel.text)
        XCTAssertEqual(sut.imageView.image, dummyImage)
        imageDownloadProtocolSpy.verifyGetImageArgs(with: dummy.image)
    }
}

// MARK: - Assertion Methods
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
            flowerItemCellDelegateSpy.verifyDidTapFavoriteButton.getArgument()?.flower,
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
