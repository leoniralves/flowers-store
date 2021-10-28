//
//  FlowersListViewController.swift
//  FlowersStore
//
//  Created by Gabriel Pereira on 28/10/21.
//

import UIKit

final class FlowersListViewController: UIViewController {
    // MARK: - Properties
    private let flowersListView: FlowersListView = .init()
    
    // MARK: - Override Methods
    override func loadView() {
        super.loadView()
        view = flowersListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
