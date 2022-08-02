//
//  AlbumDetailView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 01/08/2022.
//

import SwiftUI

struct AlbumDetailView: View {
    @Environment(\.dismiss) var dismiss
    var album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(album.image)
                    .resizable()
                    .border(.black, width: 1)
                    .frame(maxWidth: 150, maxHeight: 150)
                    .overlay(album.isFavorite ?
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .position(x: 130, y: 15)
                            :
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                                .position(x: 130, y: 15)
                    )
                
                VStack {
                    Text("My rating")
                    Text("8/10")
                        .padding()
                        .background(.green)
                        .clipShape(Circle())
                    
                }
                .padding(.top, 65)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text(album.name)
                        .font(.system(.title2, design: .rounded))
                        
                Text(album.artistName)
                    .font(.system(.body, design: .rounded))
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("Discography")
                
                Color.gray
                    .frame(maxHeight: 350)
                    .opacity(0.5)
                    .cornerRadius(20)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Text("\(Image(systemName: "chevron.left")) Back")
                }
            }
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album(name: "Egzotyka", artistName: "Quebonafide", location: "New York", image: "egzotyka", isFavorite: false))
    }
}
