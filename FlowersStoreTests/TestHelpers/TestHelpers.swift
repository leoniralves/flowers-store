//
//  TestHelpers.swift
//  ShoestockTests
//
//  Created by Leonir Deolindo on 29/12/20.
//  Copyright © 2020 Netshoes. All rights reserved.
//

import XCTest

final class TestHelpers {
    @discardableResult
    class func verifyMethodCalledOnce(
        methodName: String,
        callCount: Int,
        describeArguments: @autoclosure () -> String?,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Bool {
        if callCount == 0 {
            XCTFail(
                "Wanted but not invoked: \(methodName)",
                file: file,
                line: line
            )
            return false
        }
        if callCount > 1 {
            XCTFail(
                "Wanted 1 time but was called \(callCount) times. \(methodName) with \(String(describing: describeArguments()))",
                file: file,
                line: line
            )
            return false
        }
        return true
    }
    
    @discardableResult
    class func verifyMethodCalled(
        count: Int,
        methodName: String,
        callCount: Int,
        describeArguments: @autoclosure () -> String?,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Bool {
        if callCount == 0 {
            XCTFail(
                "Wanted but not invoked: \(methodName)",
                file: file,
                line: line
            )
            return false
        }
        if callCount > 0 && callCount != count {
            XCTFail(
                "Wanted \(count) time but was called \(callCount) times. \(methodName) with \(String(describing: describeArguments()))",
                file: file,
                line: line
            )
            return false
        }
        return true
    }
    
    class func verifyMethodNeverCalled(
            methodName: String,
            callCount: Int,
            describeArguments: @autoclosure () -> String?,
            file: StaticString = #file,
            line: UInt = #line
    ) {
        let times = callCount == 1 ? "time" : "times"
        if callCount > 0 {
            XCTFail(
                "Never wanted but was called \(callCount) \(times). \(methodName) with \(String(describing: describeArguments()))",
                file: file,
                line: line
            )
        }
    }
}
