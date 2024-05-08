//
//  DefaultNetworkService.swift
//
//
//  Created by Irinka Datoshvili on 08.05.24.
//

import Foundation

public class DefaultNetworkService: NetworkService {
    public func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            completion(data, error)
        }.resume()
    }
}
