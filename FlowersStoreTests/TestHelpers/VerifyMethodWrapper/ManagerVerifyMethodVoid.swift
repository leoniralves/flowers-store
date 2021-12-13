//
//  ManagerVerifyMethodVoid.swift
//  ShoestockTests
//
//  Created by Leonir on 29/10/21.
//  Copyright © 2021 Netshoes. All rights reserved.
//

import Foundation

/// A manager to handler all verifie method wrappers
///
/// This class must be not called without a `VerifyMethodVoid` property wrapper
struct ManagerVerifyMethodVoid {
    
    private(set) var count: Int = 0
    private(set) var methodName: String = ""
    
    /// Count every time it is called.
    ///
    /// - Parameters:
    ///   - methodName: The name of the spied method
    mutating func call(methodName: StaticString = #function) {
        count += 1
        self.methodName = methodName.description
    }
}

// MARK: - ManagerVerifyMethodProtocol
extension ManagerVerifyMethodVoid: ManagerVerifyMethodProtocol {
    var args: [String?] {
        get {
            fatalError("property `args` not implemented in ManagerVerifyMethodVoid")
        }
    }
}
