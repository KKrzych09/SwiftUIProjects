//
//  ContentView.swift
//  BetterRest
//
//  Created by Kamil Krzych on 13/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        VStack {
            DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%g") hours")
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
