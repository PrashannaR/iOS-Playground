//
//  PostsDIContainer.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import Foundation

class PostsDIContainer{
    
    static let shared = PostsDIContainer()
    
    private init(){}
    
    lazy var networkService: NetworkServiceProtocol = {
       NetworkService()
    }()
    
    lazy var postsRepo: PostsRepo = {
       PostsRepoImpl(networkService: networkService)
    }()
    
    
    func makePostsViewModel() -> PostsViewModel{
        PostsViewModel(postsRepository: postsRepo)
    }
}
