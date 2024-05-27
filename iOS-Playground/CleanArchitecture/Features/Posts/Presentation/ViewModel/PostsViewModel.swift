//
//  PostsViewModel.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [PostsResponseModel] = []
    @Published var errorMessage: String? = nil

    // send post
    @Published var title: String = ""
    @Published var body: String = ""
    @Published var userId: Int = 69
    @Published var successMessage: String? = nil
    @Published var failedMessage: String? = nil

    let postsRepo: PostsRepo

    init(postsRepository: PostsRepo) {
        postsRepo = postsRepository
    }

    // MARK: Get Posts

    func getPosts() {
        Task {
            do {
                let posts = try await postsRepo.getPosts()
                DispatchQueue.main.async { [weak self] in
                    self?.posts = posts
                    print("fetched successfully")
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    print("error while fething \(String(describing: error.localizedDescription))")
                }
            }
        }
    }

    // MARK: Send Post

    func sendPost() {
        Task {
            do {
                let post = try await postsRepo.sendPosts(for: PostsRequestModel(userId: userId, title: title, body: body))

                DispatchQueue.main.async { [weak self] in
                    self?.successMessage = "Post created successfully"
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.failedMessage = "Post creation failed"
                }
            }
        }
    }
}
