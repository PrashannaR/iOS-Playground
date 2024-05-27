//
//  PostsRepo.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import Foundation

protocol PostsRepo{
    func getPosts() async throws -> [PostsResponseModel]
    func sendPosts(for post: PostsRequestModel) async throws -> PostsResponseModel
}
