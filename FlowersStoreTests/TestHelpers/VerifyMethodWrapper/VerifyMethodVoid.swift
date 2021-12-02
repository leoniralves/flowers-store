//
//  VerifyMethodVoid.swift
//  ShoestockTests
//
//  Created by Rafael Felipe on 28/10/21.
//  Copyright © 2021 Netshoes. All rights reserved.
//

import Foundation
import XCTest

/// A generic property wrapper to create unit spy verification property
///
/// Use `VerifyMethodVoid` when you need spy a method with without arguments
///
/// To spy you should call `call()` inside the method that will be checked
///
/// * verify a method without arguments
///
///       @VerifyMethodVoid private(set) var verifyMethodFooBar
///
///       func methodFoo() {
///            verifyMethodFooBar.call()
///       }
///
/// More detail, please check the documentation on Confluence (https://magazine.atlassian.net/l/c/3mk7uZ1d) page
///
@propertyWrapper struct VerifyMethodVoid {
    var wrappedValue: ManagerVerifyMethodVoid
    
    init(wrappedValue: ManagerVerifyMethodVoid = .init()) {
        self.wrappedValue = wrappedValue
    }
}
