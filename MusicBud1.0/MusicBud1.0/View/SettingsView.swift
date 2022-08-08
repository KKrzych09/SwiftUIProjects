//
//  SettingsView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 08/08/2022.
//

import SwiftUI

struct SettingsView: View {
    
    enum WebLink: String, Identifiable {
        case rateUs = "https://www.apple.com/ios/app-store"
        case feedback = "https://www.apple.com/"
        case twitter = "https://www.twitter.com/"
        case facebook = "https://www.facebook.com/"
        case instagram = "https://www.instagram.com/"
        
        var id: UUID {
            UUID()
        }
    }
    
    @State private var link: WebLink?
    
    var body: some View {
        NavigationView {
            List {
                Image("about")
                    .resizable()
                    .scaledToFit()
                
                Section {
                    Link(destination: URL(string: WebLink.rateUs.rawValue)!, label: {
                        Label("Rate us on App Store", image: "store")
                            .foregroundColor(.primary)
                    })
                    
                    Label("Tell us your feedback", image: "chat")
                        .onTapGesture {
                            link = .feedback
                        }
                }
                
                Section {
                    Label("Twitter", image: "twitter")
                        .onTapGesture {
                            link = .twitter
                        }
                    
                    Label("Facebook", image: "facebook")
                        .onTapGesture {
                            link = .facebook
                        }
                    
                    Label("Instagram", image: "instagram")
                        .onTapGesture {
                            link = .instagram
                        }
                }
            }
            .listStyle(GroupedListStyle())
            
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(item: $link) { item in
                if let url = URL(string: item.rawValue) {
                    SafariView(url: url)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
