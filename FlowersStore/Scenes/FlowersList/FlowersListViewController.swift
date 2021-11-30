//
//  FlowersListViewController.swift
//  FlowersStore
//
//  Created by Gabriel Pereira on 28/10/21.
//

import UIKit

final class FlowersListViewController: UIViewController {
    // MARK: - Properties
    private let flowersListView: FlowersListView = .init(flowers: [.init(name: "", image: "", isFavorite: false)])
    
    private let presenter: FlowersListPresenterInput
    
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

extension FlowersListViewController: FlowersListPresenterOutput {
    
}
