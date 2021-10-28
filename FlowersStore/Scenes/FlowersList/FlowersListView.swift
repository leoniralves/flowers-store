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
        let collectionView: UICollectionView = .init()
        
        return collectionView
    }()
    
    // MARK: - Initializer Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
