//
//  UICollectionViewDataSourceProtocol.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 23/11/21.
//

import UIKit

protocol UICollectionViewDataSourceProtocol: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

extension UICollectionViewDataSourceProtocol {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
