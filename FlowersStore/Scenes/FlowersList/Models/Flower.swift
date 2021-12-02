//
//  Flower.swift
//  FlowersStore
//
//  Created by Gabriel Pereira on 24/11/21.
//

struct Flower: Identifiable, Decodable {
    let id: Int
    let name: String
    let image: String
    let isFavorite: Bool
}
