//
//  AlbumDetailView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 01/08/2022.
//

import SwiftUI

struct AlbumDetailView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var album: Album
    
    @State private var showReview = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(uiImage: UIImage(data: album.image)!)
                        .resizable()
                        .border(.black, width: 1)
                        .frame(maxWidth: 150, maxHeight: 150)
                        .overlay(album.isFavorite ?
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                    .padding([.top, .trailing], 6)
                                :
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                    .padding([.top, .trailing], 6)
                    )
                    
                    VStack {
                        Text("My rating")
                        
                        if let rating = album.rating, !showReview {
                            Image(rating.image)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .transition(.scale)
                        } else {
                            Text("None")
                                .padding()
                                .background(.gray)
                                .clipShape(Circle())
                        }
                    
                    }
                    .padding(.top, 65)
                    
                    Spacer()
                }
                .animation(.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.3), value: album.rating)
//                .frame(maxWidth: .infinity, maxHeight: 200)
                
                VStack(alignment: .leading) {
                    Text(album.name)
                        .font(.system(.title2, design: .rounded))
                
                    Text(album.artistName)
                        .font(.system(.body, design: .rounded))
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("DISCOGRAPHY")
                        .font(.system(.headline, design: .rounded))
                
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("track")
                                .font(.system(.body, design: .rounded))
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: 350)
                        .padding([.top, .bottom])
                        .background(.gray)
                        .opacity(0.5)
                    .cornerRadius(20)
                    }
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("ADDRESS")
                                .font(.system(.headline, design: .rounded))
                            
                            Text(album.location)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading) {
                            Text("PHONE")
                                .font(.system(.headline, design: .rounded))
                            
                            Text(album.phone)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("INFO")
                            .font(.system(.headline, design: .rounded))
                        Text(album.summary)
                    }
                    .padding(.top)
                    
                    NavigationLink(
                        destination:
                            MapView(location: album.location)
                                .edgesIgnoringSafeArea(.all)
                    ) {
                        MapView(location: album.location)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(20)
                    }
                    
                    Button(action: {
                        self.showReview.toggle()
                    }) {
                        Text("Rate it")
                            .font(.system(.headline, design: .rounded))
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .tint(Color(.red))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 25))
                    .controlSize(.large)
                    .padding(.bottom, 20)
                    
                }
                
                Spacer()
            }
            
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
                .opacity(showReview ? 0 : 1)
            }
        }
        .overlay(
            self.showReview ?
            ZStack {
                ReviewView(isDisplayed: $showReview, album: album)
                    .navigationBarHidden(true)
            }
            
            : nil
        )
        .onChange(of: album) { _ in
            if self.context.hasChanges {
                try? self.context.save()
            }
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AlbumDetailView(album: (PersistenceController.testData?.first)!)
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        .accentColor(.white)
    }
}
