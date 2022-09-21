//
//  ContentView.swift
//  HotProspects
//
//  Created by Kamil Krzych on 20/09/2022.
//

import SwiftUI
import SamplePackage

struct ContentView: View {
    
    let possibleNumbers = Array(1...60)
    
    var results: String {
        // Select 7 random numbers from possibleNumbers with a method from SamplePackage called random()
        // which accepts an int and will return up to that number random elements from sequence in random order.
        // Method sorted() at the end, let us arrange numbers from smallest to largest.
        let selected = possibleNumbers.random(7).sorted()
        
        // Then I need to convert that array of ints (selected) into strings using map() method that lets me convert
        // an array of one type into an array of another type by applying a function to each element.
        // In this case, one must initialize a new string from each int, so I can use String.init as the function I want
        // to call.
        let strings = selected.map(String.init)
        
        // Right now, array contains seven random numbers from my range, so last I want to do is to join them all
        // together with commas between by using joined method.
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
