//
//  VerifyMethodArgs.swift
//  ShoestockTests
//
//  Created by Rafael Felipe on 28/10/21.
//  Copyright © 2021 Netshoes. All rights reserved.
//

import Foundation

/// A generic property wrapper to create unit spy verification property
///
/// Use `VerifyMethodArgs` when you need spy a method with arguments
///
/// `T` is reference from argument get by method
///
/// Define `T` with tuple when you need verify a method with many arguments
///
/// To spy you should append `append(args: T?)` inside the method that will be checked
///
/// Use `getArgument()` when you need assert an argument get from `append(args: T?)`
///
/// * verify a method with one argument
///
///       @VerifyMethodArgs<String> private(set) var verifyMethodFoo
///
///       func methodFoo(argument: String) {
///            verifyMethodFoo.append(args: argument)
///       }
///
/// * verify a method with many argument
///
///       @VerifyMethodArgs<(String, Bool, Int)> private(set) var verifyMethodBar
///
///       func methodBar(argument1: String, argument2: Bool, argument3: Int) {
///            verifyMethodFoo.append(args: (argument1, argument2, argument3))
///       }
///
/// * verify a method with list argument
///
///       @VerifyMethodArgs<[Model]> private(set) var verifyMethodFooBar
///
///       func methodBar(argument: [Model]) {
///            verifyMethodFooBar.append(args: argument)
///       }
///
/// More detail, please check the documentation on Confluence (https://magazine.atlassian.net/l/c/3mk7uZ1d) page
///
@propertyWrapper struct VerifyMethodArgs<T> {
    var wrappedValue: ManagerVerifyMethodArguments<T>
    
    init(wrappedValue: ManagerVerifyMethodArguments<T> = .init()) {
        self.wrappedValue = wrappedValue
    }
}
