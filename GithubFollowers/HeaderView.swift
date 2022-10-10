//
//  HeaderView.swift
//  GithubFollowers
//
//  Created by Cesario Nivar on 10/10/22.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var username: String
    
    var body: some View {
        
        VStack(spacing: 0) {
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
        }
    }
}
struct HeaderView_Previews: PreviewProvider {
    @State static var username = ""
    static var previews: some View {
        HeaderView(username: $username)
    }
}
