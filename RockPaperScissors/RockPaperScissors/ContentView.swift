//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Kamil Krzych on 12/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var possibleMoves = ["Rock", "Paper", "Scissors"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var displayScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .gray]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Possible moves")
                        .font(.largeTitle)
                        .padding(.top, 180)
                        .padding(.bottom, 20)
                }
                HStack {
                    ForEach(0 ..< possibleMoves.count) { number in
                        Button(action: {
                            self.buttonTapped(number)
                        }) {
                            Text(possibleMoves[number])
                        }
                        .frame(width: 110, height: 90, alignment: .center)
                        .background(Color(red: 0.8, green: 0.8, blue: 0.7))
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .clipShape(Rectangle())
                        .overlay(RoundedRectangle(cornerRadius:0).stroke(Color.black, lineWidth: 1.3))
                    }
                }
                Text("Your score is: \(displayScore)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                Spacer()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), dismissButton: .default(Text("Continue")) {
                })
            }
        }
    }
    
    func buttonTapped(_ number: Int) {
        let comMove = possibleMoves.randomElement()
        
        if displayScore < 10 {
            if number == 0 && comMove == "Scissors" {
                scoreTitle = "\(possibleMoves[number]) beats \(String(comMove!))"
                displayScore += 1
            } else if number == 0 && comMove == "Paper" {
                scoreTitle = "\(possibleMoves[number]) loses to \(String(comMove!))"
                if (displayScore > 0){
                    displayScore -= 1
                }
            } else if number == 1 && comMove == "Rock" {
                scoreTitle = "\(possibleMoves[number]) beats \(String(comMove!))"
                displayScore += 1
            } else if number == 1 && comMove == "Scissors" {
                scoreTitle = "\(possibleMoves[number]) loses to \(String(comMove!))"
                if (displayScore > 0){
                    displayScore -= 1
                }
            } else if number == 2 && comMove == "Paper" {
                scoreTitle = "\(possibleMoves[number]) beats \(String(comMove!))"
                displayScore += 1
            } else if number == 2 && comMove == "Rock" {
                scoreTitle = "\(possibleMoves[number]) loses to \(String(comMove!))"
                if (displayScore > 0){
                    displayScore -= 1
                }
            } else {
                scoreTitle = "Draw cuz you've picked the same."
            }
            
        
        } else if displayScore == 10 {
            scoreTitle += "\nCongrats! You won!"
            displayScore = 0
        }
        
        showingScore = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
