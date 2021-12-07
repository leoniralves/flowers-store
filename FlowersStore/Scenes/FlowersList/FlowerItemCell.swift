//
//  FlowerItemCell.swift
//  FlowersStore
//
//  Created by Renato on 03/11/21.
//

import Foundation
import UIKit

protocol FlowerItemCellDelegate: AnyObject {
    func didTapFavoriteButton(flower: Flower)
}

final class FlowerItemCell: UICollectionViewCell {
    // MARK: - Properties
    private var flower: Flower?
    private weak var delegate: FlowerItemCellDelegate?
    private var imageDownloadProtocol: ImageDownloadProtocol?
    
    // MARK: - UI Components
    private(set) lazy var imageView: UIImageView = {
        let imageView: UIImageView = .init()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .yellow
        
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let titleLabel: UILabel = .init()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private(set) lazy var favoriteButton: UIButton = {
        let button: UIButton = .init()
        let favoriteImage: UIImage? = .init(systemName: "heart")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(favoriteImage, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        
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
    func setup(
        flower: Flower?,
        imageDownloadProtocol: ImageDownloadProtocol?,
        delegate: FlowerItemCellDelegate?
    ) {
        self.flower = flower
        self.delegate = delegate
        self.imageDownloadProtocol = imageDownloadProtocol
        setupLayout()
    }
    
    // MARK: - Private Methods
    private func setupLayout() {
        imageView.image = imageDownloadProtocol?.getImage(with: <#T##String#>)
        titleLabel.text = flower?.name
    }
    
    @objc private func didTapFavoriteButton() {
        guard let flower = flower else {
            return
        }
        
        delegate?.didTapFavoriteButton(flower: flower)
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
