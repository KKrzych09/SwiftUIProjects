//
//  AlbumFormViewModel.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 05/08/2022.
//

import Foundation
import Combine
import UIKit

class AlbumFormViewModel: ObservableObject {
    
    // Input
    @Published var name: String = ""
    @Published var artistName: String = ""
    @Published var location: String = ""
    @Published var phone: String = ""
    @Published var description: String = ""
    @Published var image: UIImage = UIImage()
    
    init(album: Album? = nil) {
        if let album = album {
            self.name = album.name
            self.artistName = album.artistName
            self.location = album.location
            self.phone = album.phone
            self.description = album.summary
            self.image = UIImage(data: album.image) ?? UIImage()
        }
    }
}
