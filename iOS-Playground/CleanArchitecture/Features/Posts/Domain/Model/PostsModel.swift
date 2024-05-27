//
//  PostsModel.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import Foundation

struct PostsRequestModel: Encodable{
    let userId: Int
    let title: String
    let body: String
}

struct PostsResponseModel: Decodable, Identifiable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

