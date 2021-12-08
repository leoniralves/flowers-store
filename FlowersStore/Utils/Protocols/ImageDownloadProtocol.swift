//
//  ImageDownloadProtocol.swift
//  FlowersStore
//
//  Created by Rafael Ramos on 07/12/21.
//

import UIKit

protocol ImageDownloadProtocol: AnyObject {
    func getImage(for url: String?) -> UIImage?
}
