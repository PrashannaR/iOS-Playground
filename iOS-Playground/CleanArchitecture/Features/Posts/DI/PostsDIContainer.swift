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
    
    lazy var postsRepo: PostsRepo = {
       PostsRepoImpl(networkService: NetworkService())
    }()
    
    
    func makePostsViewModel() -> PostsViewModel{
        PostsViewModel(postsRepository: postsRepo)
    }
}
