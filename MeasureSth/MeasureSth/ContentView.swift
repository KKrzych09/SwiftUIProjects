//
//  ContentView.swift
//  MeasureSth
//
//  Created by Kamil Krzych on 23/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkNumber = ""
    @State private var firstPick = 2
    @State private var secondPick = 2
    let timeUnits = ["second", "minute", "hour", "day", "year"]
    var fullOutcome: Double {
        let ifNumber = Double(checkNumber) ?? 0
        let firstUnit = String(timeUnits[firstPick])
        let secondUnit = String(timeUnits[secondPick])
        var firstConversion = ifNumber
        var secondConversion: Double = 0
        
        switch firstUnit {
        case "second":
            firstConversion /= 3600
        case "minute":
            firstConversion /= 60
        case "day":
            firstConversion *= 24
        case "year":
            firstConversion *= 8760
        default:
            firstConversion = ifNumber
        }
        
        secondConversion = firstConversion
        
        switch secondUnit {
        case "second":
            secondConversion *= 3600
            return secondConversion
        case "minute":
            secondConversion *= 60
            return secondConversion
        case "day":
            secondConversion /= 24
            return secondConversion
        case "year":
            secondConversion /= 8760
            return secondConversion
        default:
            return secondConversion
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter your value and pick a unit")) {
                    TextField("Enter the value", text: $checkNumber)
                    
                    Picker("Unit selection", selection: $firstPick) {
                        ForEach(0 ..< timeUnits.count) {
                            Text("\(self.timeUnits[$0])")
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                }
                
                Section(header: Text("Select unit to converse")) {
                    Picker("Unit selection", selection: $secondPick) {
                        ForEach(0 ..< timeUnits.count) {
                            Text("\(self.timeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("outcome")) {
                    Text("\(fullOutcome, specifier: "%.4f")")
                }
            }
            .navigationBarTitle("Time Conversion App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
