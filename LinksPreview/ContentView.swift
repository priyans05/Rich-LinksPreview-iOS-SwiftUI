//
//  ContentView.swift
//  LinksPreview
//
//  Created by PRIYANS on 11/4/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//
struct Link : Identifiable{
    var id = UUID()
    var string : String
}
import SwiftUI

struct ContentView: View {
    
    let links: [Link] = ["https://twitter.com/priyans23/status/1180787807993749507?s=20","https://developer.apple.com/swift/", "https://www.youtube.com/watch?v=IC9urbiVp4M"].map{Link(string: $0)}

    var body: some View {
        NavigationView {
            List {
                Section(footer: Text("")) {
                    ForEach(links) {
                        link in
                        LinkCell(url: URL(string: link.string)!)
                    }
                }

            }.onAppear { UITableView.appearance().separatorStyle = .none }
            .navigationBarTitle("Links")
                .environment(\.defaultMinListRowHeight, 250)

        }
    }

    private func setReaction(_ reaction: String, for link: Link) { }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
