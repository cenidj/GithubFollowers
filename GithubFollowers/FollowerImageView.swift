//
//  CustomImageView.swift
//  GithubFollowers
//
//  Created by Cesario Nivar on 10/10/22.
//

import SwiftUI

struct FollowerImageView: View {
    public var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 50, height: 50)
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerImageView(imageUrl: "")
    }
}
