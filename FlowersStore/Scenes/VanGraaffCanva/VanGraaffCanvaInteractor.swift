// 
//  VanGraaffCanvaInteractor.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 15/11/23.
//

protocol VanGraaffCanvaInteractorInput: AnyObject {
}

protocol VanGraaffCanvaInteractorOutput: AnyObject {
}

final class VanGraaffCanvaInteractor {
	// MARK: - Properties
	private weak var output: VanGraaffCanvaInteractorOutput?

	// MARK: - Public Methods
	public func setOutput(_ output: VanGraaffCanvaInteractorOutput?) {
		self.output = output
	}

	// MARK: - Private Methods
}

// MARK: - VanGraaffCanvaInteractorProtocol
extension VanGraaffCanvaInteractor: VanGraaffCanvaInteractorInput {
}