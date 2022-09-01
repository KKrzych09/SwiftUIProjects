//
//  ContentView.swift
//  JSONReader
//
//  Created by Kamil Krzych on 01/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: Model
    
    func detailView(_ row: Article) -> some View {
        WebView(content: .string(row.content))
            .navigationTitle(Text(row.title))
//            .navigationBarTitleDisplayModeIfAvailable(.inline)
    }
    
    var body: some View {
        NavigationView {
            List(model.feed?.items ?? [], id: \.url) { row in
                NavigationLink(destination: Text(row.content)) {
                    Text(row.title)
                }
            }
            Color.clear
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}
