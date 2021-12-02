//
//  FlowerItemCellDelegateSpy.swift
//  FlowersStoreTests
//
//  Created by Gabriel Pereira on 02/12/21.
//

import XCTest
@testable import FlowersStore

final class FlowerItemCellDelegateSpy: FlowerItemCellDelegate {
    @VerifyMethodArgs<Flower>
    private(set) var verifyDidTapFavoriteButton
    
    func didTapFavoriteButton(flower: Flower) {
        verifyDidTapFavoriteButton.append(args: flower)
    }
    
}
