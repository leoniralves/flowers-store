//
//  FlowerItemCellDelegateSpy.swift
//  FlowersStoreTests
//
//  Created by Gabriel Pereira on 02/12/21.
//

import XCTest
@testable import FlowersStore

final class FlowerItemCellDelegateSpy: FlowerItemCellDelegate {
    
    @VerifyMethodArgs<(cell: FlowerItemCell, flower: Flower)>
    private(set) var verifyDidTapFavoriteButton
    
    func didTapFavoriteButton(_ cell: FlowerItemCell, flower: Flower) {
        verifyDidTapFavoriteButton.append(args: (cell, flower))
    }
    
}
