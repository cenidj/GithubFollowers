//
//  ContentView.swift
//  GithubFollowers
//
//  Created by Cesario Nivar on 10/9/22.
// https://api.github.com/users/\(username)/followers

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    var followers:  [String] = []
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer(minLength: 100)
                Text("Github Followers")
                    .font(.largeTitle.bold())
                
                
                Group {
                    TextField("Username", text: $username)
                        .padding()
                        .border(.primary, width: 1)
                }
                .padding()
                
                if followers.count != 0 {
                    Text("Results")
                        .font(.title2)
                    
                    ScrollView {
                        ForEach(0..<10) { i in
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                VStack(alignment: .leading) {
                                    Text("John Doe")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
