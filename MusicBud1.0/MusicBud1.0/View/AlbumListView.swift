//
//  AlbumListView.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 31/07/2022.
//

import SwiftUI

struct AlbumListView: View {
    @State var albums = [
        Album(name: "Romantic Psycho (JPN Edition)", artistName: "Quebonafide", location: "Tokyo", phone: "69-420-33", trackList: ["1. ROMANTICPSYCHO (Ft. Taco Hemingway)", "2. JESIEŃ (Ft. Natalia Szroeder)", "3. PRZYTOBIE", "4. SZUBIENICAPESTYCYDYBROŃ", "5. TĘSKNIĘZASTARYMKANYE (Ft. Natalia Szroeder)", "6. ASPARTAM (Ft. Mata)", "7. COJESTMAŁPY (Ft. Smarki Smark)", "8. RUMPELSTILSKIN (Ft. Vito Bambino)", "9. GAZPROM (Ft. Sokół)", "10. ŚWIATTOMÓJPLACZABAW (Ft. Sentino)", "11. AJETLAGTOMÓJNOWYDRAG (Ft. Kiełas)", "12. TOKYO2020 (Ft. Taco Hemingway)", "13. NIEPŁACZĘPONOTREDAME (Ft. Bedoes)", "14. ŁAJZA (Ft. Mrozu)", "15. BUBBLETEA (Ft. Daria Zawiałow)", "16. TOWSZYSTKOBYŁODLACIEBIE (Ft. Ralph Kaminski)", "17. JESTEMKURWACZARODZIEJEM (Bonus Track #1)", "18. ZŁOTEGLOBY (Bonus Track #2) (Ft. Kukon)", "19. CZŁOWIEKZKSIĘŻYCA (Bonus Track #3)"], description: "ROMANTIC PSYCHO (Japan Edition)” to limitowany album Quebonafide, który był dodawany w preorderze do pierwszego wydania albumu “ROMANTIC PSYCHO”. W wersji japońskiej znajduje się 16 podstawowych oraz 3 bonusowe numery. Ta była dostępna tylko w preorderze “ROMANTIC PSYCHO” i do wyczerpania nakładu na stronie QueShop.pl, po jej wyprzedaniu nigdy więcej nie będzie dostępna.", image: "romantic_psycho_jpn", isFavorite: false),
        Album(name: "Romantic Psycho (EU Edition)", artistName: "Quebonafide", location: "Madrid", phone: "69-420-33", trackList: ["1. ROMANTICPSYCHO (Ft. Taco Hemingway)", "2. JESIEŃ (Ft. Natalia Szroeder)", "3. PRZYTOBIE", "4. SZUBIENICAPESTYCYDYBROŃ", "5. TĘSKNIĘZASTARYMKANYE (Ft. Natalia Szroeder)", "6. ASPARTAM (Ft. Mata)", "7. COJESTMAŁPY (Ft. Smarki Smark)", "8. RUMPELSTILSKIN (Ft. Vito Bambino)", "9. GAZPROM (Ft. Sokół)", "10. ŚWIATTOMÓJPLACZABAW (Ft. Sentino)", "11. AJETLAGTOMÓJNOWYDRAG (Ft. Kiełas)", "12. TOKYO2020 (Ft. Taco Hemingway)", "13. NIEPŁACZĘPONOTREDAME (Ft. Bedoes)", "14. ŁAJZA (Ft. Mrozu)", "15. BUBBLETEA (Ft. Daria Zawiałow)", "16. TOWSZYSTKOBYŁODLACIEBIE (Ft. Ralph Kaminski)"], description: "Docelowym albumem Quebonafide jest “ROMANTIC PSYCHO (EU Edition)”, na którym znajdują się te same utwory co w “Japan Edition”, ale bez Bonus Tracków. Album ten różni się też okładką oraz tym, że dostępny jest do kupienia tylko w sklepach Empik.", image: "romantic_psycho_eu", isFavorite: false),
        Album(name: "Egzotyka", artistName: "Quebonafide", location: "New York", phone: "69-420-33", trackList: ["1. Oh My Buddha (Ft. DJ Flip)", "2. quebahombre", "3. Szejk", "4. Bollywood (Ft. Czesław Mozil)", "5. Luis Nazário de Lima (Ft. DJ Ike)", "6. Madagaskar", "7. Changa (Ft. iFani)", "8. C'est la Vie", "9. Zorza", "10. Między słowami (Ft. Young Lungs)", "11. Arabska noc (Ft. Solar & Wac Toja", "12. To nie jest hip-hop (Ft. KRS-One)", "13. Bumerang", "14. Odyseusz (Ft. DJ Flip)"], description: "Egzotyka to materiał, który powstał z podróży na siedem różnych kontynentów. Łącznie raper odwiedził 60 krajów. Miejsca odwiedzane przez Quebonafide były inspiracją do jego utworów i klipów.", image: "egzotyka", isFavorite: true),
        Album(name: "Ezoteryka", artistName: "Quebonafide", location: "Ciechanów", phone: "69-420-33", trackList: ["1. Hype", "2. Ile mogłem (Ft. K-Leah)", "3. Paulo Coelho", "4. Harry Angel", "5. Voodoo", "6. Tarot (Ft. Justyna Kusmierczyk)", "7. Ciuchy, kobiety... (Ft. Dwa Sławy, Ras & Sitek)", "8. Carnival", "9. Żadnych zmartwień (Ft. Kuba Knap & Kuban", "10. Powszechny i śmiertelny (OG)", "11. Światłowstręt", "12. Kyrie Eleison (Ft. Guzior)", "13. Trip", "14. Ciernie (Ft. Deys)", "15. Vanilla Sky (Ft. Ten Typ Mes)"], description: "Pierwszy album studyjny polskiego rapera Quebonafide. Wydawnictwo ukazało się 27 marca 2015 roku nakładem należącej do rapera oficyny QueQuality w dystrybucji Step Records. Dzień przed premierą album został udostępniony w formie digital stream na kanale YouTube QueQuality.", image: "ezoteryka", isFavorite: false),
        Album(name: "Eklektyka", artistName: "Quebonafide", location: "Ciechanów", phone: "69-420-33", trackList: ["1. Rock'n'roller 2", "2. Avengers (Ft. DJ Klasyk & Eripe)", "3. Kostka Rubika (Ft. Neile)", "4. Miszmasz freestyle", "5. Blockbuster (Ft. TomB)", "6. Codzienność (Ft. Danny [PL])", "7. Hossa (Ft. Trzy-Sześć)", "8. Polis (Ft. Dj Długi)", "9. Lara Croft", "10. Manekin (Ft. Hary)", "11. Open Bar (Ft. Białas & TomB)", "12. 25 Godzina (Ft. Diset & TrooM)", "Eden Hazard (Ft. Muflon)"], description: "Pierwszy solowy materiał Quebonafide, którym otworzył sobie drzwi na rapowe salony i zyskał ogromne uznanie fanów. W wersji fizycznej dostępny dziś jedynie u resellerów.", image: "eklektyka", isFavorite: false),
        Album(name: "Dla Fanów Eklektyki", artistName: "Quebonafide", location: "Warszawa", phone: "69-420-33", trackList: ["1. Znaki zapytania (Ft. Eripe)", "2. Pieskie życie", "3. Half dead (Ft. ReTo)", "4. Ankh (Ft. Białas)", "5. BDSM", "6. Pablo (Ft. Paluch)", "7. LOVE"], description: "Dla Fanów Eklektyki to EPka składająca się z 7 utworów. EPka była dołączona do preorderu albumu Egzotyka, lecz tylko dla zamawiających płci męskiej.", image: "dla_fanow_eklektyki", isFavorite: false),
        Album(name: "Dla Fanek Euforii", artistName: "Quebonafide", location: "Warszawa", phone: "69-420-33", trackList: ["1. Bogini", "2. Noc w noc (Ft. PlanBe & Szopeen)", "3. Candy (Ft. Klaudia Szafrańska)", "4. Hypebae (Ft. Young Igi)", "5. Kawa i xanax (Ft. PlanBe)", "6. Co jest ze mną?", "7. LOVE"], description: "Dla Fanek Euforii to EPka składająca się z 7 utworów. EPka była dołączona do preorderu albumu Egzotyka, lecz tylko dla zamawiających płci żeńskiej.", image: "dla_fanek_euforii", isFavorite: false),
        Album(name: "Taconafide", artistName: "Quebonafide, Taco Hemingway", location: "Kraków", phone: "69-420-33", trackList: ["1. Intro", "2. Metallica 808", "3. Art-B", "4. Ekodiesel", "5. Wiem", "6. Kryptowaluty", "7. PIN", "8. 8 kobiet", "9. Tamagotchi", "10. Nóż", "11. VISA", "12. Mleko & Miód", "13. Giro d'Italia", "14. Sectumsempra", "15. Soma"], description: "Po dziś dzień zaledwie kilka muzycznych kolaboracji zapisało się na kartach historii polskiej muzyki dużymi literami. Nie jest tajemnicą, że zderzenie dwóch różnych umysłów, perspektyw i wrażliwości artystycznej potrafi zaowocować produkcjami, które z czasem zostają uznane zasłużonym mianem klasyków.", image: "taconafide", isFavorite: false),
        Album(name: "Europa", artistName: "Taco Hemingway", location: "Bruksela", phone: "69-420-33", trackList: ["1. Luxembourg", "2. Grand Prix", "3. Europa (Ft. Bedoes)", "4. Pireneje", "5. Nie Ufam Sobie Sam", "6. Big Pharma", "7. Sztylet", "8. Ortalion", "9. WWA nie Berlin (Ft. Szpaku)", "10. Pieniądz i Terror (Ft. Oki)", "11. Na Paryskie Getto Pada Deszcz (Ft. Borucci)", "12. Michael Essien Birthday Party", "13. Toskania Outro", "14. GBP Freestyle [Europa Bonus Track]"], description: "Album powstawał symultanicznie z “JARMARKIEM” i tak też będzie wydany. Praca nad “EUROPĄ” była dla mnie sposobem na odetchnięcie od ciężkawych i dusznych tematów podejmowanych na “JARMARKU”.", image: "europa", isFavorite: false),
        Album(name: "Jarmark", artistName: "Taco Hemingway", location: "Warszawa", phone: "69-420-33", trackList: ["Łańcuch I: Kiosk (Ft. Artur Rojek)", "2. Panie, to Wyście!", "3. POLSKIE TANGO (Ft. Łona)", "4. Influenza (Ft. Gruby Mielzky)", "5. Nie Mam Czasu (Ft. CatchUp)", "6. Łańcuch II: Korek (Ft. Artur Rojek)", "7. Dwuzłotówki Dancing", "8. POL Smoke", "9. W.N.P.", "10. 1990s Utopia (Ft. Katarzyna Kowalczyk)", "11. Szczękościsk", "12. Łańcuch III: Korpo (Ft. Artur Rojek)", "13. Sznycel [Jarmark Bonus Track]"], description: "Jarmark jest dwunastym projektem twórczości Taco Hemingwaya. Album został wydany 28 sierpnia 2020 na platformach streamingowych, a 4 września w wersji fizycznej wraz z albumem Europa.", image: "jarmark", isFavorite: false),
        Album(name: "Szprycer", artistName: "Taco Hemingway", location: "Poznań", phone: "69-420-33", trackList: ["1. Nostalgia", "2. Chodź", "3. Tlen", "4. Głupi byt", "5. Dele", "6. I.S.W.T", "7. 35", "8. Karimata (Mute)", "9. Saldo '07"], description: "SZPRYCER. Dziewięć piosenek o niczym i o wszystkim. Jeżeli pracowałeś nad tym projektem w jakiejkolwiek formie; wiedz, że jestem dumny. Jeżeli jesteś słuchaczem; wiedz że jestem wdzięczny. Do usłyszenia.Taco Hemingway", image: "szprycer", isFavorite: false),
        Album(name: "Marmur", artistName: "Taco Hemingway", location: "Gdańsk", phone: "69-420-33", trackList: ["1. Marmur", "2. Witaj w Hotelu Marmur", "3. Żyrandol", "4. Krwawa jesień", "5. Grubo-chude psy", "6. Portier!", "7. Mgła I (Siwe włosy)", "8. Mgła II", "9. Świat jest WFem", "10. Świecące Prostokąty", "11. Tsunami blond", "12. Ślepe sumy", "13. Żywot", "14. Ściany mają uszy", "15. Jak cień", "16. To by było na tyle", "17. Deszcz na betonie (?) II"], description: "Oto “MARMUR” – słuchowiskowa rap płyta, której bohater, enigmatycznie nazwany SZCZEŚNIAKIEM, zostaje wbrew swojej woli zameldowany w tajemniczym trójmiejskim hotelu. Na miejscu dowiaduje się, że stoi przed nim ogrom pracy, choć nikt nie mówi mu na czym ma ona polegać. ", image: "marmur", isFavorite: false),
        Album(name: "Wosk", artistName: "Taco Hemingway", location: "Warszawa", phone: "69-420-33", trackList: ["1. WOSK", "2. BXL", "3. SZCZERZE", "4. WIATR", "5. 515", "6. KOŁA"], description: "Luźna, niezapowiedziana EP-ka prosto od Taco Hemingway'a wypuszczona w trakcie prac nad nowym albumem „Marmur”.", image: "wosk", isFavorite: false),
        Album(name: "Umowa o Dzieło", artistName: "Taco Hemingway", location: "Warszawa", phone: "69-420-33", trackList: ["1. Od zera", "2. A mówiłem ci", "3. Następna stacja", "4. 6 zer", "5. +4822", "6. Awizo", "7. Białkoholicy", "8. 100km/h"], description: "Ciekawostka: na okładce widnieje Taco siedzący prawdopodobnie na stacji metra w Warszawie. Ma ze sobą walizkę, w której znajduje się jego pierwsza EP – Trójkąt Warszawski, dzięki której stał się popularny. Okładka ta jest również wykonana w podobnym stylu.", image: "umowa_o_dzielo", isFavorite: false),
        Album(name: "Trójkąt Warszawski", artistName: "Taco Hemingway", location: "Warszawa", phone: "69-420-33", trackList: ["1. Szlugi i Kalafiory", "2. Marsz, marsz", "3. Wszystko jedno", "4. Trójkąt", "5. (przerywnik)", "6. Mięso", "7. 900729"], description: "Trójkąt warszawski jest najprościej rzecz ujmując fabularną rap płytą. Opowiada o trzech bohaterach krążących po mieście szukając się nawzajem, uciekając od siebie.", image: "trojkat_warszawski", isFavorite: false)]
    
    @State private var showNewAlbum = false
                           
    var body: some View {
        NavigationView {
            List {
                ForEach(albums.indices, id: \.self) { index in
    //                FullImageRow(album: $albums[index])
                    
                    NavigationLink(destination: AlbumDetailView(album: albums[index])) {
                        BasicTextImageRow(album: $albums[index])
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
                .onDelete(perform: { indexSet in
                    albums.remove(atOffsets: indexSet)
                })
                .listRowSeparator(.hidden)
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
                .overlay(album.isFavorite ?
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                            .padding([.top, .trailing], 6)
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
            
            if let imageToShare = UIImage(named: album.image) {
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
