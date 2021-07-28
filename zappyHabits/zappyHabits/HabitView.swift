//
//  HabitView.swift
//  ZappyHabits
//
//  Created by Kamil Krzych on 28/07/2021.
//

import SwiftUI

struct HabitView: View {
    @ObservedObject var activities: Activities
    @State var selectedItem: Activity
    @State private var amount = 0
    
    static let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
            
                Text(self.selectedItem.name)
                    .font(.system(size: 25)).bold()
                
                Divider()
  
                Text(self.selectedItem.description)
                
                Divider()
                
                Text("Execution day:")
                Picker("Days", selection: $selectedItem.days) {
                    ForEach(Self.days, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Divider()
                
                Text("Save your progress:")
                Stepper(value: $amount, in: 0...365) {
                    if amount == 1 {
                        Text("\(amount) time")
                    } else {
                        Text("\(amount) times")
                    }
                }
            }
            .frame(width: 300, height: 600, alignment: .topLeading)
        }
        .navigationBarTitle("Details of \(self.selectedItem.name)")
    }
}

struct HabitView_Previews: PreviewProvider {
    static let activities = Activities()
    static let activity = [Activity]()
    
    static var previews: some View {
        HabitView(activities: activities, selectedItem: activity[0])
    }
}
