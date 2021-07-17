//
//  AstronautView.swift
//  Moonshot
//
//  Created by Kamil Krzych on 16/07/2021.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let otherMissions: [String]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Other missions he took part in:")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    ForEach(otherMissions, id: \.self) { element in
                        Text(element)
                            .padding(5)
                    }
                    
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        var matches = [String]()
        
        for mission in missions {
            for _ in mission.crew {
                if let match = mission.crew.first(where: { $0.name == astronaut.id}) {
                    matches.append("Apollo \(mission.id) - \(match.role)")
                    break
                }
            }
        }
        self.otherMissions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
