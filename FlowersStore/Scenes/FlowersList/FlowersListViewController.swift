//
//  FlowersListViewController.swift
//  FlowersStore
//
//  Created by Gabriel Pereira on 28/10/21.
//

import UIKit

final class FlowersListViewController: UIViewController {
    // MARK: - Properties
    private let presenter: FlowersListPresenterInput
    
    private lazy var flowersListView: FlowersListView = .init(
        flowers: [
            .init(id: 0, name: "", image: "", isFavorite: false)
        ],
        delegate: self
    )
    
    // MARK: - Initializer Methods
    init(presenter: FlowersListPresenterInput = FlowersListPresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func loadView() {
        super.loadView()
        view = flowersListView
    }
}

// MARK: - FlowersListPresenterOutput
extension FlowersListViewController: FlowersListPresenterOutput {
    
}

// MARK: - FlowersListViewDelegate
extension FlowersListViewController: FlowersListViewDelegate {
    func flowersListView(_ flowersListView: FlowersListView, didTapFavorite flower: Flower) {
        presenter.didTapFavoriteButton()
    }
}
