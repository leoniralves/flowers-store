//
//  FlowersListPresenter.swift
//  FlowersStore
//
//  Created by Rafael Felipe on 30/11/21.
//

import Foundation

protocol FlowersListPresenterInput: AnyObject {
    func didTapFavoriteButton()
    func getFlower() -> Flower
}

protocol FlowersListPresenterOutput: AnyObject {
    
}

final class FlowersListPresenter {
    private weak var output: FlowersListPresenterOutput?
    private let interactor: FlowersListInteractorInput
    
    init(interactor: FlowersListInteractorInput = FlowersListInteractor()) {
        self.interactor = interactor
    }
    
    func setOutput(_ output: FlowersListPresenterOutput?) {
        self.output = output
    }
}

extension FlowersListPresenter: FlowersListPresenterInput {
    func didTapFavoriteButton() {
        print("Koe")
    }
    
    func getFlower() -> Flower {
        return .init(id: 0, name: "", image: "", isFavorite: false)
    }
}
