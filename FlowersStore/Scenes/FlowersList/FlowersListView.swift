//
//  FlowersListView.swift
//  FlowersStore
//
//  Created by Gabriel Pereira on 28/10/21.
//

import UIKit

final class FlowersListView: UIView {
    // MARK: - UI Components
    private(set) lazy var collectionView: UICollectionView = {
        let layout: FlowersListCollectionViewFlowLayout = .init()
        let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Initializer Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode
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
