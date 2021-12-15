//
//  FlowersListViewDelegateSpy.swift
//  FlowersStoreTests
//
//  Created by Rafael Ramos on 15/12/21.
//

import Foundation
@testable import FlowersStore

final class FlowersListViewDelegateSpy: FlowersListViewDelegate {
    @VerifyMethodArgs<(flowersListView: FlowersListView, flower: Flower)>
    private(set) var verifyFlowersListView
    
    func flowersListView(_ flowersListView: FlowersListView, didTapFavorite flower: Flower) {
        verifyFlowersListView.append(args: (flowersListView, flower))
    }
}
