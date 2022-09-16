//
//  ContentView.swift
//  accessibilityExample
//
//  Created by Kamil Krzych on 16/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    let pictures = [
        "alex-knight-b00D8M6pSJU",
        "andre-benz-JJuW3rOu5Xg",
        "manuel-velasquez-1GNXvM18gjo",
        "ryoji-iwata-TRJjPc0wss0"
    ]
    
    let labels = [
        "Windows",
        "Metro",
        "Street",
        "Shibuya"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        NavigationView {
            VStack {
                Image(pictures[selectedPicture])
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        selectedPicture = Int.random(in: 0...3)
                    }
                    .accessibilityLabel(labels[selectedPicture])
                    .accessibilityAddTraits(.isButton)
                
                NavigationLink(destination: StepperView()) {
                    Text("Stepper View")
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
