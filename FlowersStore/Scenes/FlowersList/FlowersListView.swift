//
//  FlowersListView.swift
//  FlowersStore
//
//  Created by Gabriel Pereira on 28/10/21.
//

import UIKit

final class FlowersListView: UIView {
    // MARK: - Properties
    
    // MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let margingDistance: CGFloat = 12.0
    private let betweenDistance: CGFloat = 20.0
    private let numberOfCells: CGFloat = 2.0
    
    //    private let screenFrameSize = UIS
    
    // MARK: - Initializer Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func calculateSize() -> CGSize {
        let viewWidth = UIScreen.main.bounds.width
        let size = viewWidth - ((margingDistance * 2) + betweenDistance * numberOfCells)
        let cellSize = (size / numberOfCells)
        
        return CGSize(width: cellSize, height: cellSize)
    }
}

extension FlowersListView: ViewCode {
    func setupHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.constraintToSuperview()
    }
    
    func additionalSetups() {
        collectionView.register(FlowerItemCell.self, forCellWithReuseIdentifier: String(describing: FlowerItemCell.self))
    }
}

extension FlowersListView: UICollectionViewDelegate {
    
}

extension FlowersListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateSize()
    }
}

extension FlowersListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FlowerItemCell.self), for: indexPath) as? FlowerItemCell else {
            return UICollectionViewCell()
        }
        cell.setup()
        return cell
    }
}
