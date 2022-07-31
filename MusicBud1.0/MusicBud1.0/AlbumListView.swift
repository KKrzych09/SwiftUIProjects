//
//  ContentView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 31/07/2022.
//

import SwiftUI

struct AlbumListView: View {
    var albumNames = ["Romantic Psycho (JPN Edition)", "Romantic Psycho (EU Edition)", "Egzotyka", "Ezoteryka", "Eklektyka", "Dla Fanów Eklektyki", "Dla Fanek Euforii", "Taconafide", "Europa", "Jarmark", "Szprycer", "Marmur", "Wosk", "Umowa o Dzieło", "Trójkąt Warszawski"]
    
    var albumCovers = ["romantic_psycho_jpn", "romantic_psycho_eu", "egzotyka", "ezoteryka", "eklektyka", "dla_fanow_eklektyki", "dla_fanek_euforii", "taconafide", "europa", "jarmark", "szprycer", "marmur", "wosk", "umowa_o_dzielo", "trojkat_warszawski"]
    
    var artistNames = ["Quebonafide", "Quebonafide", "Quebonafide", "Quebonafide", "Quebonafide", "Quebonafide", "Quebonafide", "Quebonafide, Taco Hemingway", "Taco Hemingway", "Taco Hemingway", "Taco Hemingway", "Taco Hemingway", "Taco Hemingway", "Taco Hemingway", "Taco Hemingway"]
    
    var albumLocations = ["Tokyo", "Madrid", "New York", "Ciechanów", "Ciechanów", "Warszawa", "Warszawa", "Kraków", "Bruksela", "Warszawa", "Poznań", "Gdańsk", "Warszawa", "Warszawa", "Warszawa"]
    
    @State var albumIsFavorites = Array(repeating: false, count: 21)
    
                           
    var body: some View {
        List {
            ForEach(albumNames.indices, id: \.self) { index in
//                FullImageRow(imageName: albumCovers[index], name: albumNames[index], artistName: artistNames[index], location: albumLocations[index], isFavorite: $albumIsFavorites[index])
                
                BasicTextImageRow(imageName: albumCovers[index], name: albumNames[index], artistName: artistNames[index], location: albumLocations[index], isFavorite: $albumIsFavorites[index])
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
    var imageName: String
    var name: String
    var artistName: String
    var location: String
    @State private var showOptions = false
    @State private var showError = false
    @Binding var isFavorite: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(imageName)
                .resizable()
                .frame(width: 120, height: 118)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(artistName)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            
            if isFavorite {
                Spacer()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
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
