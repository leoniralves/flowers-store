// 
//  VanGraaffCanvaPresenter.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 15/11/23.
//

protocol VanGraaffCanvaPresenterInput: AnyObject {
    func getMagazineSizes(height: String, width: String)
}

protocol VanGraaffCanvaPresenterOutput: AnyObject {
    func updateView(config: VanGraaffCanvaViewConfig)
}

final class VanGraaffCanvaPresenter {
	// MARK: - Properties
	private var interactor: VanGraaffCanvaInteractorInput
	private weak var output: VanGraaffCanvaPresenterOutput?

	// MARK: - Initializer Methods
	init(interactor: VanGraaffCanvaInteractor) {
		self.interactor = interactor
	}

	// MARK: - Public Methods
	public func setOutput(_ output: VanGraaffCanvaPresenterOutput?) {
		self.output = output
	}

	// MARK: - Private Methods
}

// MARK: - VanGraaffCanvaPresenterInput
extension VanGraaffCanvaPresenter: VanGraaffCanvaPresenterInput {
    func getMagazineSizes(height: String, width: String) {
        guard let numericHeight = Double(height), let numericWidth = Double(width) else { return }
        
        let magazine: Magazine = .init(width: numericWidth, height: numericHeight)

        output?.updateView(
            config: .init(
                superiorLimit: magazine.pointI.y,
                inferiorLimit: magazine.pointC.y - magazine.pointK.y,
                internalLimit: magazine.pointI.x - magazine.pointE.x,
                ExternalLimit: magazine.pointB.x - magazine.pointK.x ,
                referencePoint: 0
            )
        )
    }
}

// MARK: - VanGraaffCanvaPresenterOutput
extension VanGraaffCanvaPresenter: VanGraaffCanvaInteractorOutput {
}
