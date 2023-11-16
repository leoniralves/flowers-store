// 
//  VanGraaffCanvaControllerBuilder.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 15/11/23.
//

import UIKit

final class VanGraaffCanvaControllerBuilder {
	// MARK: - Properties
	private var navigationController: UINavigationController
	private let controller: VanGraaffCanvaController
	private let presenter: VanGraaffCanvaPresenter
	private let interactor: VanGraaffCanvaInteractor
    
	// MARK: - Initializer Methods
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
		self.interactor = VanGraaffCanvaInteractor()
		self.presenter = VanGraaffCanvaPresenter(interactor: interactor)
		self.controller = VanGraaffCanvaController(presenter: presenter)
		self.interactor.setOutput(presenter)
		self.presenter.setOutput(controller)
	}

	// MARK: - Public Methods
	func buildAndPresent() {
		navigationController.show(build(), sender: nil)
	}
	
	func build() -> UIViewController {
		return controller
	}
}
