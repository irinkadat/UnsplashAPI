//
//  UnsplashModel.swift
//
//
//  Created by Irinka Datoshvili on 08.05.24.
//

import Foundation

public struct UnsplashPhoto: Decodable {
    public let id: String
    public let urls: URLs
}

public struct URLs: Decodable {
    public let regular: URL
}
