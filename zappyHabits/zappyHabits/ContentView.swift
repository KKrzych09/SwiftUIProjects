//
//  ContentView.swift
//  ZappyHabits
//
//  Created by Kamil Krzych on 26/07/2021.
//

import SwiftUI

struct Activity {
    let name: String
    let description: String
    let checked: Bool
}

class Activities: ObservableObject {
    @Published var items = [Activity]()
}

struct ContentView: View {
    @ObservedObject var activites = Activities()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activites.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("ZappyHabits")
            .navigationBarItems(trailing:
                Button(action: {
                    let activity = Activity(name: "Test", description: "Lorem ipsum", checked: false)
                    self.activites.items.append(activity)
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activites.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
