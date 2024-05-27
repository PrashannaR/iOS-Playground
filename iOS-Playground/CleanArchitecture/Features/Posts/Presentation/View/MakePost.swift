//
//  MakePost.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import SwiftUI

struct MakePost: View {
    @ObservedObject var viewModel: PostsViewModel

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Post Details")) {
                    TextField("Title", text: $viewModel.title)
                    TextField("Body", text: $viewModel.body)
                }
            }
            Button("Create Post") {
                viewModel.sendPost()
            }
        }
        .navigationTitle("Make Post")

    }
}

#Preview {
    NavigationView { MakePost(
        viewModel:
        PostsViewModel(postsRepository: PostsRepoImpl(networkService: NetworkService()))
    ) }
}
