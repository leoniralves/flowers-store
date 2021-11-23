//
//  UICollectionViewStub.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 23/11/21.
//

import UIKit

final class UICollectionViewStub: UICollectionView {
    var collectionViewCellToBeReturned: UICollectionViewCell?
    
    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        return collectionViewCellToBeReturned!
    }
}
