//
//  Album.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 01/08/2022.
//

import Foundation
import Combine
import CoreData

public class Album: ObservableObject {
    
    @NSManaged public var name: String
    @NSManaged public var artistName: String
    @NSManaged public var location: String
    @NSManaged public var phone: String
//    @NSManaged public var trackList: [String]
    @NSManaged public var summary: String
    @NSManaged public var image: Data
    @NSManaged public var isFavorite: Bool
    @NSManaged public var ratingText: String?
    
}
    
extension Album {
    
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
    
    var rating: Rating? {
        get {
            guard let ratingText = ratingText else {
                return nil
            }
            
            return Rating(rawValue: ratingText)
        }
        
        set {
            self.ratingText = newValue?.rawValue
        }
    }
}

