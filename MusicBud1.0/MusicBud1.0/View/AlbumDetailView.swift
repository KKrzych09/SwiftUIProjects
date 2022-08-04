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
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(album.image)
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
                        Text("8/10")
                            .padding()
                            .background(.green)
                            .clipShape(Circle())
                    
                    }
                    .padding(.top, 65)
                    
                    Spacer()
                }
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
                            ForEach(album.trackList, id: \.self) { track in
                                    Text(track)
                                    .font(.system(.body, design: .rounded))
                            }
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
                        Text(album.description)
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
            }
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AlbumDetailView(album: Album(name: "Egzotyka", artistName: "Quebonafide", location: "New York", phone: "69-420-33", trackList: ["1. Oh My Buddha (Ft. DJ Flip)", "2. quebahombre", "3. Szejk", "4. Bollywood (Ft. Czesław Mozil)", "5. Luis Nazário de Lima (Ft. DJ Ike)", "6. Madagaskar", "7. Changa (Ft. iFani)", "8. C'est la Vie", "9. Zorza", "10. Między słowami (Ft. Young Lungs)", "11. Arabska noc (Ft. Solar & Wac Toja", "12. To nie jest hip-hop (Ft. KRS-One)", "13. Bumerang", "14. Odyseusz (Ft. DJ Flip)"], description: "Egzotyka to materiał, który powstał z podróży na siedem różnych kontynentów. Łącznie raper odwiedził 60 krajów. Miejsca odwiedzane przez Quebonafide były inspiracją do jego utworów i klipów.", image: "egzotyka", isFavorite: true))
        }
        .accentColor(.white)
    }
}
