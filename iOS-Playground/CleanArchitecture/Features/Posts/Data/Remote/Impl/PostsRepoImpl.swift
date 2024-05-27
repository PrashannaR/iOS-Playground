//
//  PostsRepoImpl.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import Foundation

class PostsRepoImpl: PostsRepo {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getPosts() async throws -> [PostsResponseModel] {
        return try await networkService.request(urlPath: .posts, method: .get, body: nil)
    }

    func sendPosts(for post: PostsRequestModel) async throws -> PostsResponseModel {
        return try await networkService.request(urlPath: .posts, method: .post, body: networkService.encodeRequestBody(for: post))
    }
}
