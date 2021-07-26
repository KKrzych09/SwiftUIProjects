//
//  AddView.swift
//  ZappyHabits
//
//  Created by Kamil Krzych on 26/07/2021.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var description = ""
    @State private var checked = false
    @State private var day = 0
    @State private var totalChars = 0
    @State private var lastText = ""
    
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
                   
                Picker("Days", selection: $day) {
                    ForEach(Self.days, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
