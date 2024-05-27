//
//  PostsList.swift
//  iOS-Playground
//
//  Created by Prashanna Rajbhandari on 27/05/2024.
//

import SwiftUI

struct PostsList: View {
    @StateObject var viewModel: PostsViewModel

    init(viewModel: PostsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                postRow(post: post)
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.getPosts()
            }

            .navigationBarItems(trailing:
                NavigationLink(destination: MakePost(viewModel: viewModel)) {
                    Text("+")
                }
            )
        }
    }
}

#Preview {
    PostsList(viewModel: PostsViewModel(postsRepository: PostsRepoImpl(networkService: NetworkService())))
}

extension PostsList {
    private func postRow(post: PostsResponseModel) -> some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                Text("\(post.userId)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            VStack(alignment: .leading, content: {
                Text("\(post.title)")
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.bold)

                Text("\(post.body)")
                    .lineLimit(1)
                    .foregroundColor(.black)
                    .font(.headline)
                    .fontWeight(.light)

            })

            Spacer()
        }
        .padding()
    }
}
