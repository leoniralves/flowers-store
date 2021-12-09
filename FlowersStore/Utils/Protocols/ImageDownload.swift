//
//  ImageDownload.swift
//  FlowersStore
//
//  Created by Rafael Ramos on 09/12/21.
//

import UIKit

final class ImageDownload: ImageDownloadProtocol {
    
    private let session: URLSession
    private let task: URLSessionDataTask
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getImage(for url: String?) -> UIImage? {
        return nil
    }
}
