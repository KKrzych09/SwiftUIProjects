//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Kamil Krzych on 29/07/2021.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var hasValidAddress: Bool {
        if order.name.count < 1 || order.streetAddress.count < 1 || order.city.count < 1 || order.zip.count < 6 {
            return false
        }
        
        return true
    }

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }

            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
