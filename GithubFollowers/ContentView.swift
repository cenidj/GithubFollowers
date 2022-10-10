//
//  ContentView.swift
//  GithubFollowers
//
//  Created by Cesario Nivar on 10/9/22.
// https://api.github.com/users/\(username)/followers

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @ObservedObject var viewModel = ViewModel("cesarionivar")
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                
                Image(systemName: "pawprint.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    
                
                Text("Github Followers")
                    .font(.largeTitle.bold())
                
                
                Group {
                    TextField("Username", text: $username)
                        .padding()
                        .border(.primary, width: 1)
                }
                .padding()
                
                if viewModel.followers.count != 0 {
                    Text("Followers of Cesario Nivar")
                        .font(.title2)
                    
                    ScrollView {
                        ForEach(viewModel.followers) { follower in
                            HStack {
                                AsyncImage(url: URL(string: follower.avatar_url)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                    
                                
                                VStack(alignment: .leading) {
                                    Text(follower.login)
                                        .font(.body)
                                    Text("Agust 20, 2022")
                                        .font(.caption)
                                }
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

class ViewModel: ObservableObject {
    @Published var followers: [Follower] = []
    
    init(_ username: String) {
        let url = URL(string: "https://api.github.com/users/\(username)/followers")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {
                if let data = data {
                    let followers = try JSONDecoder().decode([Follower].self, from: data)
                    DispatchQueue.main.sync {
                        self.followers = followers
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Has occured an error!")
            }
        }
        .resume()
    }
    
    
}

struct Follower: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatar_url: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
