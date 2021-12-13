//
//  ViewCode.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 28/10/21.
//

protocol ViewCode {
    func setupHierarchy()
    func setupConstraints()
    func additionalSetups()
    func setupView()
}

extension ViewCode {
    func additionalSetups() {}
    func setupView() {
        setupHierarchy()
        setupConstraints()
        additionalSetups()
    }
}
