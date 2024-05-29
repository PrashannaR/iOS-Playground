//
//  NetworkService.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
 
    func request<T>(urlPath: URLPath, method: HTTPMethod, body: Data?) async throws -> T where T: Decodable {
        guard let url = URL(string: "\(Constants.shared.baseURL)\(urlPath)") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if method == .post {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = body
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard (200 ... 299).contains(httpResponse.statusCode) else {
            let errorCode = httpResponse.statusCode
            let errorResponse = data
            print("error code: \(errorCode) and error response \(errorResponse)")
            throw URLError(.badServerResponse)
        }

        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            print("Error occurred while decoding \(error.localizedDescription)")
            throw error
        }
    }
    
    
    //MARK: json encoder
    func encodeRequestBody<T>(for requestBody: T) -> Data? where T : Encodable {
        try? JSONEncoder().encode(requestBody)
    }
}
