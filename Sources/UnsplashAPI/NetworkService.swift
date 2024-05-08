//
//  NetworkService.swift
//
//
//  Created by Irinka Datoshvili on 08.05.24.
//

import Foundation

public protocol NetworkService {
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}
