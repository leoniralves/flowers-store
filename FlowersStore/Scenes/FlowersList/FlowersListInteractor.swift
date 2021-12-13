//
//  FlowersListInteractor.swift
//  FlowersStore
//
//  Created by Kauê Sales on 30/11/21.
//

import Foundation

protocol FlowersListInteractorInput: AnyObject {
    
}

protocol FlowersListInteractorOutput: AnyObject {
    
}

class FlowersListInteractor {
    private weak var output: FlowersListInteractorOutput?
    
    func setOutput(_ output: FlowersListInteractorOutput?) {
        self.output = output
    }
}

extension FlowersListInteractor: FlowersListInteractorInput {
    
}
