//
//  ContentView.swift
//  ZappyHabits
//
//  Created by Kamil Krzych on 26/07/2021.
//

import SwiftUI

struct Activity: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var days: String
    var amount: Int
}

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        // this let me encode data I want to add into JSON
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    // this let me present decoded data in a right way
    init() {
        // this line attempts to read whatever is in "Items" as a Data object
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            // this handle the unarchiving Data object into array of Activity objects
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}

struct ContentView: View {
    @ObservedObject var activites = Activities()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activites.items, id: \.name) { item in
                    NavigationLink(destination: HabitView(activities: activites, selectedItem: item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text("Which day: \(item.days)")
                                    .font(.footnote)
                            }
                            
                            Spacer()
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("ZappyHabits")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddHabit = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $showingAddHabit) {
            AddView(activities: self.activites)
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
