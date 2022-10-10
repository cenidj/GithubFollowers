//
//  ViewModel.swift
//  GithubFollowers
//
//  Created by Cesario Nivar on 10/10/22.

// Github Endpoint
// https://api.github.com/users/\(username)/followers

import Foundation

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
