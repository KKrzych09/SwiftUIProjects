//
//  AlbumListView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 31/07/2022.
//

import SwiftUI

struct AlbumListView: View {
    @State var albums = [Album(name: "Romantic Psycho (JPN Edition)", artistName: "Quebonafide", location: "Tokyo", image: "romantic_psycho_jpn", isFavorite: false), Album(name: "Romantic Psycho (EU Edition)", artistName: "Quebonafide", location: "Madrid", image: "romantic_psycho_eu", isFavorite: false), Album(name: "Egzotyka", artistName: "Quebonafide", location: "New York", image: "egzotyka", isFavorite: false), Album(name: "Ezoteryka", artistName: "Quebonafide", location: "Ciechanów", image: "ezoteryka", isFavorite: false), Album(name: "Eklektyka", artistName: "Quebonafide", location: "Ciechanów", image: "eklektyka", isFavorite: false), Album(name: "Dla Fanów Eklektyki", artistName: "Quebonafide", location: "Warszawa", image: "dla_fanow_eklektyki", isFavorite: false), Album(name: "Dla Fanek Euforii", artistName: "Quebonafide", location: "Warszawa", image: "dla_fanek_euforii", isFavorite: false), Album(name: "Taconafide", artistName: "Quebonafide, Taco Hemingway", location: "Kraków", image: "taconafide", isFavorite: false), Album(name: "Europa", artistName: "Taco Hemingway", location: "Bruksela", image: "europa", isFavorite: false), Album(name: "Jarmark", artistName: "Taco Hemingway", location: "Warszawa", image: "jarmark", isFavorite: false), Album(name: "Szprycer", artistName: "Taco Hemingway", location: "Poznań", image: "szprycer", isFavorite: false), Album(name: "Marmur", artistName: "Taco Hemingway", location: "Gdańsk", image: "marmur", isFavorite: false), Album(name: "Wosk", artistName: "Taco Hemingway", location: "Warszawa", image: "wosk", isFavorite: false), Album(name: "Umowa o Dzieło", artistName: "Taco Hemingway", location: "Warszawa", image: "umowa_o_dzielo", isFavorite: false), Album(name: "Trójkąt Warszawski", artistName: "Taco Hemingway", location: "Warszawa", image: "trojkat_warszawski", isFavorite: false)]
                           
    var body: some View {
        List {
            ForEach(albums.indices, id: \.self) { index in
//                FullImageRow(album: $albums[index])
                
                BasicTextImageRow(album: $albums[index])
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
        
        AlbumListView()
            .preferredColorScheme(.dark)
    }
}


struct BasicTextImageRow: View {
    
    // MARK: - Binding
    
    @Binding var album: Album
    
    // MARK: - State variables
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(album.image)
                .resizable()
                .frame(width: 120, height: 118)
                .cornerRadius(5)
                .overlay( album.isFavorite ?
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .position(x: 100, y: 18)
                        : nil
                )
            
            VStack(alignment: .leading) {
                Text(album.name)
                    .font(.system(.title2, design: .rounded))
                
                Text(album.artistName)
                    .font(.system(.body, design: .rounded))
                
                Text(album.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            
            
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .actionSheet(isPresented: $showOptions) {
            ActionSheet(title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                            .default(Text("Add to collection")) {
                                self.showError.toggle()
                            },
                            .default(album.isFavorite ? Text("Remove from favorites") : Text("Mark as favorite")) {
                                self.album.isFavorite.toggle()
                            },
                            .cancel()
                            ])
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not available yet"),
                  message: Text("Sorry, this feature is not available yet"),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel())
        }
    }
}

struct FullImageRow: View {
    
    var imageName: String
    var name: String
    var artistName: String
    var location: String
    @State private var showOptions = false
    @State private var showError = false
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(5)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(.title2, design: .rounded))
                    
                    Text(artistName)
                        .font(.system(.body, design: .rounded))
                    
                    Text(location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                if isFavorite {
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .actionSheet(isPresented: $showOptions) {
            ActionSheet(title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                            .default(Text("Add to collection")) {
                                self.showError.toggle()
                            },
                            .default(isFavorite ? Text("Remove from favorites") : Text("Mark as favorite")) {
                                self.isFavorite.toggle()
                            },
                            .cancel()
                            ])
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not available yet"),
                  message: Text("Sorry, this feature is not available yet"),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel())
        }
    }
}
