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
    private lazy var sut: FlowersListView = .init(
        flowers: [
            .init(id: 1, name: "PlantDummy_1", image: "http://dummy_1.com", isFavorite: false),
            .init(id: 2, name: "PlantDummy_2", image: "http://dummy_2.com", isFavorite: false)
        ],
        delegate: nil
    )
    
    // MARK: - Computed Properties
    lazy var collectionSub: UICollectionViewStub =  {
        let layout: UICollectionViewFlowLayout = .init()
        let collectionView: UICollectionViewStub = .init(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
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
        let numberOfItemsInSection: Int = 2
        let assertObject = sut.collectionView.dataSource?.collectionView(sut.collectionView, numberOfItemsInSection: numberOfItemsInSection)
        
        XCTAssertEqual(assertObject, numberOfItemsInSection)
    }
    
    func test_cellForRow_onCollectionViewCell_whenRowIsInvalid_shouldReturnCollectionViewCell() {
        collectionSub.collectionViewCellToBeReturned = UICollectionViewCell()
        let cell: UICollectionViewCell? = sut.collectionView.dataSource?.collectionView(collectionSub, cellForItemAt: .init())
        
        XCTAssertFalse(cell is FlowerItemCell)
    }
    
    func test_cellForRow_onCollectionViewCell_titleLabelContainsExpectedContent() {
        let cell: FlowerItemCell? = givenCell() as? FlowerItemCell
        
        XCTAssertEqual(cell?.titleLabel.text, "PlantDummy_1")
    }
    
    private func givenCell(dummyIndexPath: IndexPath = .init(item: 0, section: 0)) -> UICollectionViewCell? {
        let cell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: dummyIndexPath)
        
        return cell
    }
    
}
