//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Kamil Krzych on 07/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("First")
            Text("Second")
        }
        .customModified(with: "Hacking with Swift")
    }
}

struct CustomModifier: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
        }
    }
}

extension View {
    func customModified(with text: String) -> some View {
        self.modifier(CustomModifier(text: text))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
