//
//  NetworkServiceProtocol.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(urlPath: URLPath, method: HTTPMethod, body: Data?) async throws -> T
    
    func encodeRequestBody<T: Encodable>(for requestBody: T) -> Data?
}
