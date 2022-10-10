//
//  FollowerDescriptionView.swift
//  GithubFollowers
//
//  Created by Cesario Nivar on 10/10/22.
//

import SwiftUI

struct FollowerDescriptionView: View {
    var follower: Follower
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(follower.login)
                .font(.body)
            Text(follower.type)
                .font(.caption)
        }
    }
}

struct FollowerDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerDescriptionView(follower:   Follower(id: 2, login: "cenidj", avatar_url: "https://avatars.githubusercontent.com/u/8686407?v=4", type: "User"))
    }
}
