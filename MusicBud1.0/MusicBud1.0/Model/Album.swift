//
//  Album.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 01/08/2022.
//

import Foundation
import Combine

class Album: ObservableObject {
    
    enum Rating: String, CaseIterable {
        case awesome
        case good
        case okay
        case bad
        case terrible
        
        var image: String {
            switch self  {
            case .awesome: return "love"
            case .good: return "cool"
            case .okay: return "happy"
            case .bad: return "sad"
            case .terrible: return "angry"
            }
        }
    }
    
    @Published var name: String
    @Published var artistName: String
    @Published var location: String
    @Published var phone: String
    @Published var trackList: [String]
    @Published var description: String
    @Published var image: String
    @Published var isFavorite: Bool = false
    @Published var rating: Rating?
    
    init(name: String, artistName: String, location: String, phone: String, trackList: [String], description: String, image: String, isFavorite: Bool = false, rating: Rating? = nil) {
        self.name = name
        self.artistName = artistName
        self.location = location
        self.phone = phone
        self.trackList = trackList
        self.description = description
        self.image = image
        self.isFavorite = isFavorite
        self.rating = rating
    }
}
