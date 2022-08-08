//
//  MainView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 08/08/2022.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTabIndex = 2
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            AlbumListView()
                .tabItem {
                    Label("Collection", systemImage: "square.stack")
                }
                .tag(2)
            
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(3)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(4)
        }
        .accentColor(Color(.darkGray))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
