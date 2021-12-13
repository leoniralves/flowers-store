//
//  ManagerVerifyMethodProtocol.swift
//  ShoestockTests
//
//  Created by Leonir on 29/10/21.
//  Copyright © 2021 Netshoes. All rights reserved.
//

import Foundation

protocol ManagerVerifyMethodProtocol {
    associatedtype T
    
    var count: Int { get }
    var args: [T] { get }
    var methodName: String { get }
    
    func getDescribeArgs() -> String?
    
    /// Verify if a method was called one time
    /// - Parameters:
    ///   - file: The class file
    ///   - line: The method class line
    /// - Returns: Return `true` if it was called - result is discartable
    func wasCalledOnce(
        file: StaticString,
        line: UInt
    ) -> Bool
    
    /// Verify if a method was called `count` time
    /// - Parameters:
    ///   - count: The number of times to check if a method has been called
    ///   - file: The class file
    ///   - line: The method class line
    /// - Returns: Return `true` if it was called accord `count` times - result is discartable
    func wasCalled(
        count: Int,
        file: StaticString,
        line: UInt
    ) -> Bool
    
    /// Verify if a method was never called
    /// - Parameters:
    ///   - describeArguments: String to describe a context failed message
    ///   - file: The class file
    ///   - line: The method class line
    func wasNeverCalled(
        file: StaticString,
        line: UInt
    )
}

extension ManagerVerifyMethodProtocol {
    @discardableResult
    func wasCalledOnce(
        file: StaticString = #file,
        line: UInt = #line
    ) -> Bool {
        return TestHelpers.verifyMethodCalledOnce(
            methodName: methodName,
            callCount: count,
            describeArguments: getDescribeArgs(),
            file: file,
            line: line
        )
    }
    
    @discardableResult
    func wasCalled(
        count: Int,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Bool {
        return TestHelpers.verifyMethodCalled(
            count: count,
            methodName: methodName,
            callCount: self.count,
            describeArguments: getDescribeArgs(),
            file: file,
            line: line
        )
    }
    
    func wasNeverCalled(
        file: StaticString = #file,
        line: UInt = #line
    ) {
        TestHelpers.verifyMethodNeverCalled(
            methodName: methodName,
            callCount: count,
            describeArguments: getDescribeArgs(),
            file: file,
            line: line
        )
    }
    
    func getDescribeArgs() -> String? {
        guard !args.isEmpty else { return nil }
        
        return "\(methodName) - \(args.map { String(describing: $0) })"
    }
}
