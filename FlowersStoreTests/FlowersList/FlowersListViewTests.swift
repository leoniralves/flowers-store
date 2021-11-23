//
//  FlowersListViewTests.swift
//  FlowersStoreTests
//
//  Created by Kaue on 10/11/21.
//

import XCTest
@testable import FlowersStore

final class FlowersListViewTests: XCTestCase {
    // MARK: - Properties
    private var expectedNumberOfItemsInList: Int = 10
    private lazy var sut: FlowersListView = .init(numberOfItems: expectedNumberOfItemsInList)
    
    // MARK: - Test Methods
    func test_init_collectionViewIsNotNil() {
        XCTAssertNotNil(sut.collectionView)
    }
    
    func test_init_collectionView_delegateAndDataSourceIsNotNil() {
        XCTAssertNotNil(sut.collectionView.delegate)
        XCTAssertNotNil(sut.collectionView.dataSource)
    }
    
    func test_init_collectionView_collectionViewLayoutTypeIsFlowersListCollectionViewFlowLayout() {
        XCTAssertTrue(sut.collectionView.collectionViewLayout is FlowersListCollectionViewFlowLayout)
    }
    
    func test_init_collectionView_assertThatCollectionViewHasFlowerItemCellRegistered() {
        let dummyIndexPath: IndexPath = .init(item: 0, section: 0)
        let cell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: dummyIndexPath)
        
        XCTAssertTrue(cell is FlowerItemCell, "Assert that cell is FlowerItemCell type 💣")
    }
    
    func test_init_collectionView_assertNumberOfItemsIsTheExpected() {
        let dummySection: Int = 0
        let assertObject = sut.collectionView.dataSource?.collectionView(sut.collectionView, numberOfItemsInSection: dummySection)
        
        XCTAssertEqual(assertObject, expectedNumberOfItemsInList)
    }
    
    func test_cellForRow_onCollectionViewCell_whenRowIsInvalid_shouldReturnCollectionViewCell() {
        let cell: UICollectionViewCell? = givenCell(dummyIndexPath: .init(item: -1, section: 0))
        
        XCTAssertFalse(cell is FlowerItemCell)
    }
    
    func test_cellForRow_onCollectionViewCell_titleLabelContainsExpectedContent() {
        let cell: FlowerItemCell? = givenCell() as? FlowerItemCell
        
        XCTAssertEqual(cell?.titleLabel.text, "Rosa")
    }
    
    private func givenCell(dummyIndexPath: IndexPath = .init(item: 0, section: 0)) -> UICollectionViewCell? {
        let cell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: dummyIndexPath)
        
        return cell
    }
    
}
