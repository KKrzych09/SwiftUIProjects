//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kamil Krzych on 12/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var possibleMoves = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        VStack {
            ForEach(0 ..< possibleMoves.count) {
                Text(self.possibleMoves[$0])
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
