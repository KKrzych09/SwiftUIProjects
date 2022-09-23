//
//  Card.swift
//  FlashCards
//
//  Created by Kamil Krzych on 23/09/2022.
//

import Foundation


struct Card {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played Barney Stinson on HIMYM?", answer: "Neil Patrick Harris")
}
