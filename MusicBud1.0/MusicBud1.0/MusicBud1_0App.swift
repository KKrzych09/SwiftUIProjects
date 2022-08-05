//
//  MusicBud1_0App.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 31/07/2022.
//

import SwiftUI

@main
struct MusicBud1_0App: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            AlbumListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
