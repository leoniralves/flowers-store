//
//  FlowerItemCell.swift
//  FlowersStore
//
//  Created by Renato on 03/11/21.
//

import Foundation
import UIKit

final class FlowerItemCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let titleLabel: UILabel = .init()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rosa"
        return titleLabel
    }()
    
    init() {
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FlowerItemCell: ViewCode {
    func setupHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        
    }
    
}
