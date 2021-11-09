//
//  UICollectionFlowLayout.swift
//  FlowersStore
//
//  Created by Rafael Felipe on 09/11/21.
//

import Foundation
import UIKit

final class UIColletcionFlowLayout: UICollectionViewFlowLayout {
    private let margingDistance: CGFloat = 12.0
    private let betweenDistance: CGFloat = 20.0
    private let numberOfCells: CGFloat = 2.0
    
    private let maxNumColumns: Int = 2
    
    private func calculateSize() -> CGSize {
        let viewWidth = UIScreen.main.bounds.width
        let size = viewWidth - ((margingDistance * 2) + betweenDistance * numberOfCells)
        let cellSize = (size / numberOfCells)
        
        let heightSize: CGFloat = (cellSize * 1.2)
        
        return CGSize(width: cellSize, height: heightSize)
    }
    
    override func prepare() {
        guard let collectionView = collectionView else {
            return
        }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        itemSize = CGSize(width: cellWidth, height: 100)
    }
}
