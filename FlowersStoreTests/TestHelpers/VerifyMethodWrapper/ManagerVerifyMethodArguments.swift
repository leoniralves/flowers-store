//
//  ManagerVerifyMethodArguments.swift
//  ShoestockTests
//
//  Created by Leonir on 29/10/21.
//  Copyright © 2021 Netshoes. All rights reserved.
//

import Foundation

/// A manager to handler all verifie method wrappers
///
/// This class must be not called without a `ManagerVerifyMethodArguments` property wrapper
struct ManagerVerifyMethodArguments<T>: ManagerVerifyMethodProtocol {
    
    private(set) var count: Int = 0
    private(set) var args: [T] = []
    private(set) var methodName: String = ""
    
    /// Count every time it is called. It will append `args` every time that is called.
    ///
    /// - Parameters:
    ///   - args: The argument from `T` type get by spied method
    ///   - methodName: The name of the spied method
    mutating func append(args: T, methodName: StaticString = #function) {
        count += 1
        self.args.append(args)
        self.methodName = methodName.description
    }
    
    /// Get the first argument appended on `append(args: T)`
    /// - Returns: Argument with `T` type
    func getArgument() -> T? {
        return args.first
    }
    
    /// Get all arguments appended on `append(args: T)`
    /// - Returns: List of argument `T` type
    func getArguments() -> [T] {
        return args
    }
}
