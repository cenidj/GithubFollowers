//
//  ContentView.swift
//  GithubFollowers
//
//  Created by Cesario Nivar on 10/9/22.

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @ObservedObject var viewModel = ViewModel("cesarionivar")
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                HeaderView(username: $username)
                
                if viewModel.followers.count != 0 {
                    Text("Followers of Cesario Nivar")
                        .font(.title2)
                    
                    ScrollView {
                        ForEach(viewModel.followers) { follower in
                            HStack {
                                FollowerImageView(imageUrl: follower.avatar_url)
                                FollowerDescriptionView(follower: follower)
                            }
                            .padding()
                            .frame(width: geometry.size.width, alignment: .leading)
                            .background(.gray.opacity(0.05))
                        }
                        .padding(-5)
                    }
                } else {
                    Spacer(minLength: 600)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
