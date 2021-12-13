//
//  ImageDownloadProtocolSpy.swift
//  FlowersStoreTests
//
//  Created by Kauê Sales on 08/12/21.
//

import XCTest
import UIKit
@testable import FlowersStore

final class ImageDownloadProtocolSpy: ImageDownloadProtocol {
    @VerifyMethodArgs<String?>
    private(set) var verifyGetImage
    
    var getImageToBeReturned: UIImage? = nil
    
    func getImage(for url: String?) -> UIImage? {
        verifyGetImage.append(args: url)
        
        return getImageToBeReturned
    }
}

extension ImageDownloadProtocolSpy {
    func verifyGetImageArgs(with path: String, file: StaticString = #file, line: UInt = #line) {
        guard verifyGetImage.wasCalledOnce(file: file, line: line) else { return }

        XCTAssertEqual(verifyGetImage.getArgument(), path)
    }
}
