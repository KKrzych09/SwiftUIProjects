//
//  AddView.swift
//  ZappyHabits
//
//  Created by Kamil Krzych on 26/07/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var description = ""
    @State private var days = "Mon"
    @State private var amount = 0
    @State private var day = 0
    @State private var totalChars = 0
    @State private var lastText = ""
    @ObservedObject var activities: Activities
    
    static let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        NavigationView {
            Form {

                TextField("Name", text: $name)
                
                ZStack(alignment: .topLeading) {
                    if description.isEmpty {
                        Text("Description")
                            .accentColor(.gray)
                            .opacity(0.25)
                    }
                    
                    TextEditor(text: $description)
                        .frame(height: 100)
                        .onChange(of: description, perform: { text in
                            totalChars = text.count
                            
                            if totalChars <= 100 {
                                lastText = description
                            } else {
                                self.description = lastText
                            }
                        })
                    
                    ProgressView("Chars: \(totalChars) / 100", value: Double(totalChars), total: 100)
                            .frame(width: 150)
                            .accentColor(.black)
                            .padding(.top, 100)
                }
                   
                Picker("Days", selection: $days) {
                    ForEach(Self.days, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            .navigationBarTitle("New habit")
            .navigationBarItems(trailing: Button("Save") {
                let item = Activity(name: self.name, description: self.description, days: self.days, amount: self.amount)
                self.activities.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
