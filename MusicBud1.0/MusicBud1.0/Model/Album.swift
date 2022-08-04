//
//  Album.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 01/08/2022.
//

import Foundation

struct Album {
    var name: String = ""
    var artistName: String = ""
    var location: String = ""
    var phone: String = ""
    var trackList: [String] = []
    var description: String = ""
    var image: String = ""
    var isFavorite: Bool = false
    
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
}
