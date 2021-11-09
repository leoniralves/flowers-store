//
//  FlowerListCollectionViewFlowLayout.swift
//  FlowersStore
//
//  Created by Rafael Felipe on 09/11/21.
//

import Foundation
import UIKit

final class FlowerListCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private let maxNumColumns: Int = 2
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else {
            return
        }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width - 48
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        itemSize = CGSize(width: cellWidth, height: (cellWidth * 1.2))
        sectionInsetReference = .fromSafeArea
        sectionInset = UIEdgeInsets(top: minimumInteritemSpacing, left: 24, bottom: 0, right: 24)
    }
}
