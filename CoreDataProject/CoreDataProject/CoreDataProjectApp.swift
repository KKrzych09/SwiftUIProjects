//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Kamil Krzych on 11/08/2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
