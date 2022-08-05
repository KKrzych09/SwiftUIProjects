//
//  AlbumListView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 31/07/2022.
//

import SwiftUI

struct AlbumListView: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
            entity: Album.entity(),
            sortDescriptors: [])
        var albums: FetchedResults<Album>
    
    @State private var showNewAlbum = false
                           
    var body: some View {
        NavigationView {
            List {
                if albums.count == 0 {
                    Image("emptydata")
                        .resizable()
                        .scaledToFit()
                } else {
                    ForEach(albums.indices, id: \.self) { index in
        //                FullImageRow(album: $albums[index])
                        
                        NavigationLink(destination: AlbumDetailView(album: albums[index])) {
                            BasicTextImageRow(album: albums[index])
                                .swipeActions(edge: .leading, allowsFullSwipe: false, content: {
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "star")
                                    }
                                    .tint(.green)
                                    
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "square.and.arrow.up")
                                    }
                                    .tint(.orange)
                                    
                                })
                                .swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
                                    Button(role:  .destructive, action: {
                                        albums.remove(at: index)
                                    }) {
                                        Label("Delete", systemImage: "trash")
                                    }
                            })
                        }
                            
                    }
                    .onDelete(perform: deleteRecord)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("MusicBud")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button(action: {
                    self.showNewAlbum = true
                }) {
                    Image(systemName: "plus")
                        .accentColor(.primary)
                }
            }
        }
        .sheet(isPresented: $showNewAlbum) {
            NewAlbumView()
        }
    }
    
    private func deleteRecord(indexSet: IndexSet) {
        
        for index in indexSet {
            let itemToDelete = albums[index]
            context.delete(itemToDelete)
        }
        
        DispatchQueue.main.async {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
        AlbumListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .preferredColorScheme(.dark)
        
        BasicTextImageRow(album: (PersistenceController.testData?.first)!)
            .previewLayout(.sizeThatFits)
    }
}


struct BasicTextImageRow: View {
    
    // MARK: - Binding
    
    @ObservedObject var album: Album
    
    // MARK: - State variables
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            if let imageData = album.image {
                Image(uiImage: UIImage(data: imageData) ?? UIImage())
                    .resizable()
                    .frame(width: 120, height: 118)
                    .cornerRadius(5)
                    .overlay(album.isFavorite ?
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                .padding([.top, .trailing], 6)
                            : nil
                    )
            }
            
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
        .contextMenu {
            Button(action: {
                
            }) {
                HStack {
                    Text("Add to collection")
                    Image(systemName: "plus")
                }
            }
            
            Button(action: {
                self.album.isFavorite.toggle()
            }) {
                HStack {
                    Text(album.isFavorite ? "Remove from favorites" : "Mark as a favorite" )
                    Image(systemName: "star")
                }
            }
            
            Button(action: {
                self.showOptions.toggle()
            }) {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not available yet"),
                  message: Text("Sorry, this feature is not available yet"),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel())
        }
        .sheet(isPresented: $showOptions) {
            
            let defaultText = "Just adding to collection an album \(album.name)"
            
            if let imageData = album.image,
               let imageToShare = UIImage(data: imageData) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
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
