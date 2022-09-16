//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kamil Krzych on 02/05/2021.
//

import SwiftUI

struct properFlag: View {
    var countryFlags: String
    
    var body: some View {
        Image(countryFlags)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var displayScore = 0
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    // Animation props
    @State private var animationOpacity = 1.0
    @State private var animationCorrect = 0.0
    @State private var besidesTheCorrect = false
    @State private var besidesTheWrong = false
    @State private var selectedFlag = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        
                        self.selectedFlag = number
                        
                        self.flagTapped(number)
                       
                    }) {
                        properFlag(countryFlags: self.countries[number])
                    }
                    .rotation3DEffect(.degrees(number == self.correctAnswer ? self.animationCorrect : 0), axis: (x: 0, y: 1, z: 0))
                    .opacity(number != self.correctAnswer && self.besidesTheCorrect ? self.animationOpacity : 1)
                    .background(self.besidesTheWrong && self.selectedFlag == number ? Capsule(style: .circular).fill(Color.red).blur(radius: 30) : Capsule(style: .circular).fill(Color.clear).blur(radius: 0))
                    .opacity(self.besidesTheWrong && self.selectedFlag != number ? self.animationOpacity : 1)
                    .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                                        
                }
                
                Text("Your score is: \(displayScore)")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            displayScore += 1
            
            // Create animation for the correct answer
            withAnimation {
                self.animationCorrect += 360
                self.animationOpacity = 0.25
                self.besidesTheCorrect = true
            }
        } else {
            scoreTitle = "Wrong! \n That was the flag of \(countries[number])"
            displayScore = 0
            
            // Create animation for the wrong answer
            withAnimation {
                self.animationOpacity = 0.25
                self.besidesTheWrong = true
            }
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        besidesTheCorrect = false
        besidesTheWrong = false
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
