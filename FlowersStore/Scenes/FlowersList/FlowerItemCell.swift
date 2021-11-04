//
//  FlowerItemCell.swift
//  FlowersStore
//
//  Created by Renato on 03/11/21.
//

import Foundation
import UIKit

final class FlowerItemCell: UICollectionViewCell {
    // MARK: - UI Components
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = .init()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .yellow
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel: UILabel = .init()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rosa"
        
        return titleLabel
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button: UIButton = .init()
        let favoriteImage: UIImage? = .init(systemName: "heart")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(favoriteImage, for: .normal)
        
        return button
    }()
    
    // MARK: - Initializer Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func setup() {
        print("\(Self.self) \(#function)")
    }
}

// MARK: - ViewCode
extension FlowerItemCell: ViewCode {
    func setupHierarchy() {
        addSubviews(imageView, titleLabel, favoriteButton)
    }
    
    func setupConstraints() {
        imageView
            .topAnchorToSuperview()
            .trailingAnchorToSuperview()
            .leadingAnchorToSuperview()
        
        titleLabel
            .topAnchor(equalTo: imageView.bottomAnchor, constant: 8)
            .trailingAnchor(equalTo: imageView.trailingAnchor)
            .leadingAnchor(equalTo: imageView.leadingAnchor)
            .bottomAnchorToSuperview(constant: -8)
        
        favoriteButton
            .heightAnchor(equalTo: 44)
            .widthAnchor(equalTo: 44)
            .topAnchor(equalTo: imageView.topAnchor, constant: 8)
            .trailingAnchor(equalTo: imageView.trailingAnchor, constant: -8)
    }
    
    func additionalSetups() {
        backgroundColor = .red
    }
}
