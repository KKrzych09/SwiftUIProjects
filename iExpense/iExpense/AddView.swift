//
//  AddView.swift
//  iExpense
//
//  Created by Kamil Krzych on 05/07/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "personal"
    @State private var amount = ""
    @State private var showAlert = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                    
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                let actualAmount = Int(self.amount)
                if ((actualAmount) != nil) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount!)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    showAlert = true
                }
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Incorrect amount"))
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
