//
//  TestPeriphery.swift
//  FlowersStore
//
//  Created by Leonir Deolindo on 02/05/22.
//

import Foundation
import UIKit

protocol Test {
    func something()
}

struct SeLiga {
    let name: String
}

class OlhaLesk {
    
    let seLiga: SeLiga
    var opa: String?
    
    init(seliga: SeLiga = SeLiga(name: "Opa")) {
        self.seLiga = seliga
    }
    
    func test() {
        let label = UILabel()
        label.text = seLiga.name
    }
}
