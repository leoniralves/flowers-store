// 
//  VanGraaffCanvaController.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 15/11/23.
//

import UIKit

final class VanGraaffCanvaController: UIViewController {
	// MARK: - Properties
    private lazy var customView: VanGraaffCanvaView = .init()
	private var presenter: VanGraaffCanvaPresenterInput

	// MARK: - Initializer Methods
	init(presenter: VanGraaffCanvaPresenterInput) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Override Methods
	override func viewDidLoad() {
		super.viewDidLoad()

        customView.fill(delegate: self)
        customView.backgroundColor = .white
	}

    // MARK: - Override Methods
    override func loadView() {
        view = customView
    }

	// MARK: - Public Methods

	// MARK: - Private Methods
}

// MARK: - VanGraaffCanvaControllerDisplay
extension VanGraaffCanvaController: VanGraaffCanvaPresenterOutput {
    func updateView(config: VanGraaffCanvaViewConfig) {
        customView.update(config: config)
    }
}

extension VanGraaffCanvaController: VanGraaffCanvaViewDelegate {
    func calculate(height: String, width: String) {
        presenter.getMagazineSizes(height: height, width: width)
    }
}
