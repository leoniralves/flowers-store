//
//  Flower+Mock.swift
//  FlowersStoreTests
//
//  Created by Gabriel Pereira on 08/12/21.
//

@testable import FlowersStore

extension Flower {
    static func make(
        id: Int = 1,
        name: String = "dummyName",
        image: String = "dummyImage",
        isFavorite: Bool = false
    ) -> Self {
        .init(
            id: id,
            name: name,
            image: image,
            isFavorite: isFavorite
        )
    }
}
