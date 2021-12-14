//
//  FlowersListView.swift
//  FlowersStore
//
//  Created by Gabriel Pereira on 28/10/21.
//

import UIKit

protocol FlowersListViewDelegate: AnyObject {
    func flowersListView(_ flowersListView: FlowersListView, didTapFavorite flower: Flower)
}

final class FlowersListView: UIView {
    // MARK: - Properties
    private let flowers: [Flower]
    private var indexPathForFavoriteItem: IndexPath?
    private weak var delegate: FlowersListViewDelegate?
    
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
    init(
        flowers: [Flower],
        delegate: FlowersListViewDelegate?
    ) {
        self.flowers = flowers
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func updateFavorite() {
//        indexPathForFavoriteItem
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

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension FlowersListView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flowers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FlowerItemCell.self), for: indexPath) as? FlowerItemCell else {
            return UICollectionViewCell()
        }
        cell.setup(flower: flowers[indexPath.item], imageDownloadProtocol: ImageDownload(), delegate: self)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //...
    }
}

extension FlowersListView: FlowerItemCellDelegate {
    func didTapFavoriteButton(_ cell: FlowerItemCell, flower: Flower) {
        indexPathForFavoriteItem = collectionView.indexPath(for: cell)
        
        delegate?.flowersListView(self, didTapFavorite: flower)
    }
}
