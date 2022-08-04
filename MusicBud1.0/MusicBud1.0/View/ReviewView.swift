//
//  ReviewView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 04/08/2022.
//

import SwiftUI

struct ReviewView: View {
    
    @State private var showRatings = false
    
    @Binding var isDisplayed: Bool
    
    var album: Album
    
    var body: some View {
        ZStack {
            Image(album.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .opacity(0.6)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack {
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.3)) {
                            self.isDisplayed = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 30.0))
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                }
            }
            
            VStack(alignment: .leading) {
                
                ForEach(Album.Rating.allCases, id: \.self) { rating in
                    HStack {
                        Image(rating.image)
                        Text(rating.rawValue.capitalized)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .opacity(showRatings ? 1.0 : 0)
                    .offset(x: showRatings ? 0 : 1000)
                    .animation(.easeOut.delay(Double(Album.Rating.allCases.firstIndex(of: rating)!) * 0.05), value: showRatings)
                }
            }
        }
        .onAppear {
            showRatings.toggle()
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(isDisplayed: .constant(true), album: Album(name: "Egzotyka", artistName: "Quebonafide", location: "New York", phone: "69-420-33", trackList: ["1. Oh My Buddha (Ft. DJ Flip)", "2. quebahombre", "3. Szejk", "4. Bollywood (Ft. Czesław Mozil)", "5. Luis Nazário de Lima (Ft. DJ Ike)", "6. Madagaskar", "7. Changa (Ft. iFani)", "8. C'est la Vie", "9. Zorza", "10. Między słowami (Ft. Young Lungs)", "11. Arabska noc (Ft. Solar & Wac Toja", "12. To nie jest hip-hop (Ft. KRS-One)", "13. Bumerang", "14. Odyseusz (Ft. DJ Flip)"], description: "Egzotyka to materiał, który powstał z podróży na siedem różnych kontynentów. Łącznie raper odwiedził 60 krajów. Miejsca odwiedzane przez Quebonafide były inspiracją do jego utworów i klipów.", image: "egzotyka", isFavorite: true))
    }
}
