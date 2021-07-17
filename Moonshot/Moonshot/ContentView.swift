//
//  ContentView.swift
//  Moonshot
//
//  Created by Kamil Krzych on 07/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showMembers = false
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if (self.showMembers) {
                            Text(mission.formattedLaunchDate)
                        } else {
                            ForEach(mission.crew, id: \.role) { crew in
                                Text(crew.name.capitalized)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(action: {self.showMembers.toggle()}) {
                    Text(showMembers ? "Show names" : "Show dates")
                        .frame(alignment: .leading)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
