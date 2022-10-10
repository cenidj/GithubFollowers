//
//  Model.swift
//  GithubFollowers
//
//  Created by Cesario Nivar on 10/10/22.
//

import Foundation

struct Follower: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatar_url: String
    let type: String
}
