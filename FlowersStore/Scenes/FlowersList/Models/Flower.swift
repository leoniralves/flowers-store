//
//  Flower.swift
//  FlowersStore
//
//  Created by Gabriel Pereira on 24/11/21.
//

struct Flower: Identifiable, Decodable {
    var id: Int
    var name: String
    var image: String
    var isFavorite: Bool
}
